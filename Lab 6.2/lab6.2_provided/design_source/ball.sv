//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Zuofu Cheng   08-19-2023                               --
//    Fall 2023 Distribution                                             --
//                                                                       --
//    For use with ECE 385 USB + HDMI Lab                                --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  ball ( input logic Reset, frame_clk,
			   input logic [7:0] keycode,
               output logic [9:0]  BallX, BallY, BallS );
    
    logic [9:0] Ball_X_Motion, Ball_Y_Motion;
	
    //only display pixels between horizontal 0-639 and vertical 0-479 (640x480)
    parameter [9:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis
    
    assign BallS = 16;  // default ball size
   
    always_ff @ (posedge frame_clk or posedge Reset) //make sure the frame clock is instantiated correctly
    begin: Move_Ball
        if (Reset)  // asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
			Ball_X_Motion <= 10'd0; //Ball_X_Step;
			BallY <= Ball_Y_Center;
			BallX <= Ball_X_Center;
        end
           
        else 
        begin     // motion is the vector(with direction), vector = move / clk
                  // step is parameter, denote the scale of each vector

                        // initial set
                		if (keycode == 8'h1A)  // W
                            begin
                                Ball_Y_Motion <= (~ (Ball_Y_Step) + 1'b1);
                                Ball_X_Motion <= 10'd0;
                            end 
                        else if (keycode == 8'h16) // S
                            begin 
                                Ball_Y_Motion <= 10'd1;
                                Ball_X_Motion <= 10'd0;
                            end
                        else if (keycode == 8'h4) // A
                            begin 
                                Ball_X_Motion <= (~ (Ball_X_Step) + 1'b1);
                                Ball_Y_Motion <=  10'd0;
                            end
                        else if (keycode == 8'h7) // D
                            begin 
                                Ball_X_Motion <= 10'd1;
                                Ball_Y_Motion <=  10'd0;
                            end

                 if ( (BallY + BallS) >= Ball_Y_Max )  // Ball is at the bottom edge, BOUNCE!
					begin  
                        if ((keycode == 8'h16) || (Ball_Y_Motion == 10'd1)) // S
                            begin 
                                Ball_Y_Motion <= 10'd0;
                            end 
                    end
				 if ( BallY <=  BallS )  // Ball is at the top edge, BOUNCE!
                    begin
					    if ((keycode == 8'h1A) || (Ball_Y_Motion == (~ (Ball_Y_Step) + 1'b1)))  // W
                            begin
                                Ball_Y_Motion <= 10'd0;
                            end 
                    end
				 if ( (BallX + BallS) >= Ball_X_Max )  // Ball is at the Right edge, BOUNCE!
                    begin 
					  if ((keycode == 8'h7) || (Ball_X_Motion == 10'd1)) // D
                            begin 
                                Ball_X_Motion <= 10'd0;
                            end
                    end
				 if ( BallX <= BallS )  // Ball is at the Left edge, BOUNCE!
					begin
                        if ((keycode == 8'h4) || (Ball_X_Motion == (~ (Ball_X_Step) + 1'b1))) // A
                            begin 
                                Ball_X_Motion <= 10'd0;
                            end
                    end

				 
				 BallY <= (BallY + Ball_Y_Motion);  // Update ball position
				 BallX <= (BallX + Ball_X_Motion);
			
		end  
    end
      
endmodule