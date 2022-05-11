module CLA32bit(in1, in2, carry_in, sum, carry_out);
// initial parameter
parameter data = 32;
// inputs
input [data -1 :0] in1;
input [data -1 :0] in2;
input carry_in;
//outputs
output [data -1 :0] sum;
output carry_out;

wire [data -1 :0] G; // carry generate
wire [data -1 :0] P; // carry propagate
wire [data :0] carry_tmp; // carry temporary

genvar j, i;
generate
 assign carry_tmp[0] = carry_in;
 
 //calculate carry
 for(j = 0; j < data; j = j + 1) begin: carry_generator
	 assign G[j] = in1[j] & in2[j];
	 assign P[j] = in1[j] | in2[j];
	 assign carry_tmp[j+1] = G[j] | P[j] & carry_tmp[j];
	end
 
 assign carry_out = carry_tmp[data];
 //calculate sum
 for(i = 0; i < data; i = i+1) begin: sum_without_carry
		assign sum[i] = in1[i] ^ in2[i] ^ carry_tmp[i];
	end 
	
endgenerate
endmodule


// test bench of CLA
module testbench();

parameter data = 16;

 reg carry_in; 
 reg [data-1:0] in1; 
 reg [data-1:0] in2; 

 wire carry_out; 
 wire [data-1:0] sum; 
 
CLA32bit test(.sum (sum[data-1:0]),.carry_out (carry_out),.in1 (in1[data-1:0]),.in2 (in2[data-1:0]),.carry_in (carry_in));
 initial begin
  in1 = -32'd23;
  in2 = 32'd10;
  carry_in = 1'b0;
  end 
endmodule
