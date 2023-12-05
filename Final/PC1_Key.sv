module PC1_Key( input logic [63:0] input_data,
            output logic [55:0] permutate_data );
    
    // 56,   48,    40,   32,    24,    16,    8,  0,    57,    49,   41,    33,    25,   17, 9,    1,     58,   50,    42,    34,   26, 18,   10,     2,   59,    51,    43,   35,
    // 62,   54,    46,   38,    30,    22,   14,  6,    61,    53,   45,    37,    29,   21, 13,    5,    60,   52,    44,    36,   28, 20,   12,     4,   27,    19,    11,    3
    
    always_comb 
    begin
        permutate_data[ 55 ] = input_data [ 7 ];
        permutate_data[ 54 ] = input_data [ 15 ];
        permutate_data[ 53 ] = input_data [ 23 ];
        permutate_data[ 52 ] = input_data [ 31 ];
        permutate_data[ 51 ] = input_data [ 39 ];
        permutate_data[ 50 ] = input_data [ 47 ];
        permutate_data[ 49 ] = input_data [ 55 ];
        permutate_data[ 48 ] = input_data [ 63 ];
        permutate_data[ 47 ] = input_data [ 6 ];
        permutate_data[ 46 ] = input_data [ 14 ];
        permutate_data[ 45 ] = input_data [ 22 ];
        permutate_data[ 44 ] = input_data [ 30 ];
        permutate_data[ 43 ] = input_data [ 38 ];
        permutate_data[ 42 ] = input_data [ 46 ];
        permutate_data[ 41 ] = input_data [ 54 ];
        permutate_data[ 40 ] = input_data [ 62 ];
        permutate_data[ 39 ] = input_data [ 5 ];
        permutate_data[ 38 ] = input_data [ 13 ];
        permutate_data[ 37 ] = input_data [ 21 ];
        permutate_data[ 36 ] = input_data [ 29 ];
        permutate_data[ 35 ] = input_data [ 37 ];
        permutate_data[ 34 ] = input_data [ 45 ];
        permutate_data[ 33 ] = input_data [ 53 ];
        permutate_data[ 32 ] = input_data [ 61 ];
        permutate_data[ 31 ] = input_data [ 4 ];
        permutate_data[ 30 ] = input_data [ 12 ];
        permutate_data[ 29 ] = input_data [ 20 ];
        permutate_data[ 28 ] = input_data [ 28 ];
        permutate_data[ 27 ] = input_data [ 1 ];
        permutate_data[ 26 ] = input_data [ 9 ];
        permutate_data[ 25 ] = input_data [ 17 ];
        permutate_data[ 24 ] = input_data [ 25 ];
        permutate_data[ 23 ] = input_data [ 33 ];
        permutate_data[ 22 ] = input_data [ 41 ];
        permutate_data[ 21 ] = input_data [ 49 ];
        permutate_data[ 20 ] = input_data [ 57 ];
        permutate_data[ 19 ] = input_data [ 2 ];
        permutate_data[ 18 ] = input_data [ 10 ];
        permutate_data[ 17 ] = input_data [ 18 ];
        permutate_data[ 16 ] = input_data [ 26 ];
        permutate_data[ 15 ] = input_data [ 34 ];
        permutate_data[ 14 ] = input_data [ 42 ];
        permutate_data[ 13 ] = input_data [ 50 ];
        permutate_data[ 12 ] = input_data [ 58 ];
        permutate_data[ 11 ] = input_data [ 3 ];
        permutate_data[ 10 ] = input_data [ 11 ];
        permutate_data[ 9 ] = input_data [ 19 ];
        permutate_data[ 8 ] = input_data [ 27 ];
        permutate_data[ 7 ] = input_data [ 35 ];
        permutate_data[ 6 ] = input_data [ 43 ];
        permutate_data[ 5 ] = input_data [ 51 ];
        permutate_data[ 4 ] = input_data [ 59 ];
        permutate_data[ 3 ] = input_data [ 36 ];
        permutate_data[ 2 ] = input_data [ 44 ];
        permutate_data[ 1 ] = input_data [ 52 ];
        permutate_data[ 0 ] = input_data [ 60 ];
    end 
    
endmodule

