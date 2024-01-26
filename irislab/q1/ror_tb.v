`timescale 1ns / 1ns
`include "ror.v"

module ror_tb;
    reg [3:0] input_bits;
    reg k1, k2;
    wire [3:0] output_bits;

    ror my_ror (
        .input_bits(input_bits),
        .k1(k1),
        .k2(k2),
        .output_bits(output_bits)
  );

    

    

    // Stimulus generation
    initial begin

        $dumpfile("ror_tb.vcd");
        $dumpvars(0, ror_tb);

        // Test case 1
        input_bits = 4'b0101;
        k1 = 1'b0;
        k2 = 1'b1;
        #10;
        $display("Test Case 1: input_bits=%b, k1=%b, k2=%b, output_bits=%b", input_bits, k1, k2, output_bits);
        //2
        input_bits = 4'b0101;
        k1 = 1'b0;
        k2 = 1'b1;
        #10;
        $display("Test Case 2: input_bits=%b, k1=%b, k2=%b, output_bits=%b", input_bits, k1, k2, output_bits);
      
        //3
        input_bits = 4'b1010;
        k1 = 1'b1;
        k2 = 1'b0;
        #10;
        $display("Test Case 3: input_bits=%b, k1=%b, k2=%b, output_bits=%b", input_bits, k1, k2, output_bits);
        //3
        input_bits = 4'b1010;
        k1 = 1'b1;
        k2 = 1'b1;
        #10;
        $display("Test Case 4: input_bits=%b, k1=%b, k2=%b, output_bits=%b", input_bits, k1, k2, output_bits);
        
        $finish;
    end

    

endmodule
