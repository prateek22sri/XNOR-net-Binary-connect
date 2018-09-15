
/****************************************************************************
 * scalar_multiplier_v_tb.v
 ****************************************************************************/


/**
 * Module: scalar_multiplier_v_tb
 *
 * TODO: Add module documentation
 */
module scalar_multiplier_v_tb;

    wire [31 : 0]      scalar;
    wire [255 : 0]  in_vector;
    wire [255 : 0]  out_vector;

    assign scalar = 32'h10;

    assign in_vector = {32'h56839f3a,32'h5d3bb349,32'h01d3a5b1,32'he5780056,32'h11223344,32'h99887766,32'h44556677,32'h55667788};

    scalar_multiplier_v_area multiplier  (
            .scalar (scalar),
            .in_vector (in_vector),
            .out_vector (out_vector)
        );



endmodule


