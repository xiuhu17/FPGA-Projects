// whole idea is: update curr_state use previous state's next_state
// use curr_state to get next_state and output signal
module control (input logic Clk,
                input logic Run,
                input logic ClearA_LoadB,
                input logic Reset,
                input logic M, 
                output logic ShiftA, Adder_en_A, 
                output logic ShiftB, Adder_en_B, 
                output logic ShiftX, Adder_en_X, 
                output logic Sub_Add,
                output logic Clear_A                // 1 sub 0 Add
                );
    
    // enum to layout different stage
    // curr_state and next_state
    enum logic [4:0] {A, B, B_, C, C_, D,  D_, E, E_, F, F_, G, G_, H, H_, I, I_ ,J, prev_B} curr_state, next_state; 


    // synchronize reset 
    // updates flip flop, current state is the only one
    // it always load the output next_state from combinational block into this sequential block 
    // update the curr_state base on previous cycle's next_state or reset, second part
    // accept [previos's next_state]/[reset], use it to update its [current curr_state] 
    always_ff @ (posedge Clk)  
    begin
        if (Reset)
            curr_state <= A;
        else 
            curr_state <= next_state;
    end


    // use [current curr_state] to update [next_state which is for next_cycle]
    // combinational logic 
    always_comb
    begin                           
        next_state = curr_state;    // default action
        Sub_Add = 1'b0; 
        unique case (curr_state) 


            A :    if (Run)     // for situation when someone never his Run button, stuck into this state
                       next_state = prev_B;
            // eight states for eight shifts
            prev_B: next_state = B;
            B :    next_state = B_;
            B_:     next_state = C;
            C :    next_state = C_;
            C_:     next_state = D;
            D :    next_state = D_;
            D_:     next_state = E;
            E :    next_state = E_;
            E_:     next_state = F;
            F :    next_state = F_;
            F_:     next_state = G;
            G :    next_state = G_;
            G_:     next_state = H;
            H :    next_state = H_;
            H_:     next_state = I;
            I :    next_state = I_;
            I_:     next_state = J;
            J :    if (~Run)                // according to the Q/A, we need one Run per cycle, only Run is low, we go back to A
                                            // this is for dealing the situation when someone holding the Run button without releasing
                       next_state = A;

        endcase 


        // use updated [current curr_state] to do the corrosponding signal
        case (curr_state)                   // get the signal output, base on updated curr_state, third part
            A:  // clear A, Load B, clear X
                // if not run, then stay in this state forever 
                // normally, the (output = input), here, we do not need to do this, since we only have one input load signal
                // here we use reset to do everything
                begin
                    ShiftA = 1'b0;
                    Adder_en_A = 1'b0;

                    ShiftB = 1'b0;
                    Adder_en_B = 1'b0;
                    
                    ShiftX = 1'b0;
                    Adder_en_X = 1'b0;

                    Clear_A = 1'b0;
                end    
 
            prev_B :
                begin
                    ShiftA = 1'b0;
                    Adder_en_A = 1'b0;

                    ShiftB = 1'b0;
                    Adder_en_B = 1'b0;
                    
                    ShiftX = 1'b0;
                    Adder_en_X = 1'b0;

                    Clear_A = 1'b1;
                end  
            B, C, D, E, F, G, H:  // Adder_en_A base on M, Adder_en_X base on M
                begin
                    ShiftA = 1'b0;

                    ShiftB = 1'b0;
                    Adder_en_B = 1'b0;

                    ShiftX = 1'b0;

                    if (M) begin
                        Sub_Add = 1'b0;         // Add
                        Adder_en_A = 1'b1;
                        Adder_en_X = 1'b1;
                    end else begin 
                        Adder_en_A = 1'b0;
                        Adder_en_X = 1'b0;
                    end 

                    Clear_A = 1'b0;
                end
            I:  // for possible sub
                begin

                    ShiftA = 1'b0;


                    ShiftB = 1'b0;
                    Adder_en_B = 1'b0;

                    ShiftX = 1'b0;

                    if (M) begin
                        Sub_Add = 1'b1;         // Sub
                        Adder_en_A = 1'b1;
                        Adder_en_X = 1'b1;
                    end else begin 
                        Adder_en_A = 1'b0;
                        Adder_en_X = 1'b0;
                    end 

                    Clear_A = 1'b0;
                end
            J:
                begin

                    ShiftA = 1'b0;
                    Adder_en_A = 1'b0;


                    ShiftB = 1'b0;
                    Adder_en_B = 1'b0;
                    

                    ShiftX = 1'b0;
                    Adder_en_X = 1'b0;


                    Clear_A = 1'b0;
                end
            default:   // for shift 
                begin 

                    ShiftA = 1'b1;
                    Adder_en_A = 1'b0;

                    ShiftB = 1'b1;
                    Adder_en_B = 1'b0;
                    
                    ShiftX = 1'b1;
                    Adder_en_X = 1'b0;


                    Clear_A = 1'b0;
                end

        endcase 
    end 

endmodule