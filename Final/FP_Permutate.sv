module FP_Permutate(input logic[63:0] input_data, 
                    output logic[63:0] output_data);
    always_comb
    begin 
        output_data [ 63 ] = input_data[ 24 ];
        output_data [ 62 ] = input_data[ 56 ];
        output_data [ 61 ] = input_data[ 16 ];
        output_data [ 60 ] = input_data[ 48 ];
        output_data [ 59 ] = input_data[ 8 ];
        output_data [ 58 ] = input_data[ 40 ];
        output_data [ 57 ] = input_data[ 0 ];
        output_data [ 56 ] = input_data[ 32 ];
        output_data [ 55 ] = input_data[ 25 ];
        output_data [ 54 ] = input_data[ 57 ];
        output_data [ 53 ] = input_data[ 17 ];
        output_data [ 52 ] = input_data[ 49 ];
        output_data [ 51 ] = input_data[ 9 ];
        output_data [ 50 ] = input_data[ 41 ];
        output_data [ 49 ] = input_data[ 1 ];
        output_data [ 48 ] = input_data[ 33 ];
        output_data [ 47 ] = input_data[ 26 ];
        output_data [ 46 ] = input_data[ 58 ];
        output_data [ 45 ] = input_data[ 18 ];
        output_data [ 44 ] = input_data[ 50 ];
        output_data [ 43 ] = input_data[ 10 ];
        output_data [ 42 ] = input_data[ 42 ];
        output_data [ 41 ] = input_data[ 2 ];
        output_data [ 40 ] = input_data[ 34 ];
        output_data [ 39 ] = input_data[ 27 ];
        output_data [ 38 ] = input_data[ 59 ];
        output_data [ 37 ] = input_data[ 19 ];
        output_data [ 36 ] = input_data[ 51 ];
        output_data [ 35 ] = input_data[ 11 ];
        output_data [ 34 ] = input_data[ 43 ];
        output_data [ 33 ] = input_data[ 3 ];
        output_data [ 32 ] = input_data[ 35 ];
        output_data [ 31 ] = input_data[ 28 ];
        output_data [ 30 ] = input_data[ 60 ];
        output_data [ 29 ] = input_data[ 20 ];
        output_data [ 28 ] = input_data[ 52 ];
        output_data [ 27 ] = input_data[ 12 ];
        output_data [ 26 ] = input_data[ 44 ];
        output_data [ 25 ] = input_data[ 4 ];
        output_data [ 24 ] = input_data[ 36 ];
        output_data [ 23 ] = input_data[ 29 ];
        output_data [ 22 ] = input_data[ 61 ];
        output_data [ 21 ] = input_data[ 21 ];
        output_data [ 20 ] = input_data[ 53 ];
        output_data [ 19 ] = input_data[ 13 ];
        output_data [ 18 ] = input_data[ 45 ];
        output_data [ 17 ] = input_data[ 5 ];
        output_data [ 16 ] = input_data[ 37 ];
        output_data [ 15 ] = input_data[ 30 ];
        output_data [ 14 ] = input_data[ 62 ];
        output_data [ 13 ] = input_data[ 22 ];
        output_data [ 12 ] = input_data[ 54 ];
        output_data [ 11 ] = input_data[ 14 ];
        output_data [ 10 ] = input_data[ 46 ];
        output_data [ 9 ] = input_data[ 6 ];
        output_data [ 8 ] = input_data[ 38 ];
        output_data [ 7 ] = input_data[ 31 ];
        output_data [ 6 ] = input_data[ 63 ];
        output_data [ 5 ] = input_data[ 23 ];
        output_data [ 4 ] = input_data[ 55 ];
        output_data [ 3 ] = input_data[ 15 ];
        output_data [ 2 ] = input_data[ 47 ];
        output_data [ 1 ] = input_data[ 7 ];
        output_data [ 0 ] = input_data[ 39 ];
    end

endmodule;