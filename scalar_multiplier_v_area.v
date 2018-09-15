
/****************************************************************************
 * scalar_multiplier_v_area.v
 ****************************************************************************/


/**
 * Module: scalar_multiplier_v_area
 *
 * TODO: Add module documentation
 */
module scalar_multiplier_v_area #(
        parameter        TOTAL_WIDTH    = 32,
        parameter        VECTOR_SIZE    = 8
        ) (
        input [TOTAL_WIDTH - 1:0]     scalar,
        input [(TOTAL_WIDTH*VECTOR_SIZE) - 1:0]    in_vector,
        output [(TOTAL_WIDTH*VECTOR_SIZE) - 1:0]   out_vector
        );


    wire signed [TOTAL_WIDTH - 1:0] s_scalar;
    wire signed [TOTAL_WIDTH - 1: 0] s_in_vector [VECTOR_SIZE-1 : 0];
    wire signed [(TOTAL_WIDTH*2) - 1: 0] s_out_vector [VECTOR_SIZE-1 : 0];

    assign s_scalar = scalar;

    generate
        genvar i;
        for ( i = 0; i < VECTOR_SIZE; i = i + 1) begin : MULT_32b
            assign s_in_vector[i] = in_vector[(i * TOTAL_WIDTH) +: TOTAL_WIDTH];
            assign out_vector[(i * TOTAL_WIDTH) +: TOTAL_WIDTH]  = s_out_vector[i];

            scalar_multiplier_v_32b mult_32b (
                    .scalar (s_scalar),
                    .in (s_in_vector[i]),
                    .out (s_out_vector[i])
                );
        end
    endgenerate
endmodule


