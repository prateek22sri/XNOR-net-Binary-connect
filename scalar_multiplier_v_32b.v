
/****************************************************************************
 * scala_multiplier_v_32b.v
 ****************************************************************************/


/**
 * Module: scalar_multiplier_v_32b
 *
 * TODO: Add module documentation
 */
module scalar_multiplier_v_32b # (
        parameter    WIDTH  = 32
        ) (
        input    [WIDTH-1 : 0 ]    scalar,
        input    [WIDTH-1 : 0 ]    in,
        output   [WIDTH-1 : 0 ]    out
        );

    parameter    TMP_WIDTH = 16;

    wire signed [TMP_WIDTH-1 : 0] tmp_scalar;
    wire signed [TMP_WIDTH-1 : 0] tmp_in;
    wire signed [WIDTH-1 : 0]     tmp_out;
    reg  signed [TMP_WIDTH-1 : 0] partial [TMP_WIDTH-1 : 0];

    assign tmp_scalar = scalar[TMP_WIDTH-1:0];
    assign tmp_in = in[TMP_WIDTH-1:0];
    assign out = tmp_out;

    generate
        genvar i;
            for (i = 0; i < TMP_WIDTH; i = i + 1) begin
                always @(scalar,in) begin
                    if (~scalar[i])
                        partial[i] <= 16'h0;
                    else begin
                        partial[i] <= tmp_in>>>(TMP_WIDTH-i);
                    end
                end
            end
    endgenerate


    assign tmp_out =
          (partial[15]<<15)
        + (partial[14]<<14)
        + (partial[13]<<13)
        + (partial[12]<<12)
        + (partial[11]<<11)
        + (partial[10]<<10)
        + (partial[9]<<9)
        + (partial[8]<<8)
        + (partial[7]<<7)
        + (partial[6]<<6)
        + (partial[5]<<5)
        + (partial[4]<<4)
        + (partial[3]<<3)
        + (partial[2]<<2)
        + (partial[1]<<1)
        + partial[0];
endmodule


