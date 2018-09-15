
/****************************************************************************
 * scalar_multiplier_v.v
 ****************************************************************************/


/**
 * Module: scalar_multiplier_v
 *
 * TODO: Add module documentation
 */
module scalar_multiplier_v #(
        parameter        TOTAL_WIDTH    = 32,
        parameter        VECTOR_SIZE    = 8
        ) (
        input [TOTAL_WIDTH - 1:0]     scalar,
        input [(TOTAL_WIDTH*VECTOR_SIZE) - 1:0]    in_vector,
        output [(TOTAL_WIDTH*VECTOR_SIZE) - 1:0]   out_vector
);

        wire signed [TOTAL_WIDTH - 1:0] s_scalar;
        wire signed [TOTAL_WIDTH - 1: 0] s_in_vector [VECTOR_SIZE-1 : 0];
        reg signed [(TOTAL_WIDTH*2) - 1: 0] s_out_vector [VECTOR_SIZE-1 : 0];

        assign s_scalar = scalar;

        generate
            genvar i;
                for ( i = 0; i < VECTOR_SIZE; i = i + 1) begin : MULT
                    assign s_in_vector[i] = in_vector[(i * TOTAL_WIDTH) +: TOTAL_WIDTH];
                    assign out_vector[(i * TOTAL_WIDTH) +: TOTAL_WIDTH]  = s_out_vector[i];

                    always @(s_scalar, s_in_vector[i]) begin
                        s_out_vector[i] <= s_in_vector[i] * s_scalar;
                    end
                end
        endgenerate
endmodule


