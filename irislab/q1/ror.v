`timescale 1ns / 1ns


module mux_2to1 (
    input wire a,       // Input signal 0
    input wire b,       // Input signal 1
    input wire select,  // Control signal to select between inputs
    output wire out     // Output signal
);

    assign out = (select == 1'b0) ? a : b;  // Conditional assignment based on the select signal

endmodule


module ror(
    input wire [3:0] input_bits,  // 4-bit input
    input wire k1,  // Select line for muxes 1 to 4
    input wire k2,  // Select line for muxes 5 to 8
    output wire [3:0] output_bits  
);


  // First set of muxes
  wire [3:0] stage1;

  mux_2to1 mux1 (.a(input_bits[0]), .b(input_bits[2]), .select(k1), .out(stage1[0]));
  mux_2to1 mux2 (.a(input_bits[1]), .b(input_bits[3]), .select(k1), .out(stage1[1]));
  mux_2to1 mux3 (.a(input_bits[2]), .b(input_bits[0]), .select(k1), .out(stage1[2]));
  mux_2to1 mux4 (.a(input_bits[3]), .b(input_bits[1]), .select(k1), .out(stage1[3]));

 //
  wire [3:0] mux5_out, mux6_out, mux7_out, mux8_out;
  
  mux_2to1 mux5 (.a(stage1[0]), .b(stage1[1]), .select(k2), .out(output_bits[0]));
  mux_2to1 mux6 (.a(stage1[1]), .b(stage1[2]), .select(k2), .out(output_bits[1]));
  mux_2to1 mux7 (.a(stage1[2]), .b(stage1[3]), .select(k2), .out(output_bits[2]));
  mux_2to1 mux8 (.a(stage1[3]), .b(stage1[0]), .select(k2), .out(output_bits[3]));

endmodule
