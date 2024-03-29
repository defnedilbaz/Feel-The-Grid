module lfsr (out, enable, clk, reset); 
output [8:0] out;
input enable, clk, reset;
reg [8:0] out;
wire linear_feedback;
assign linear_feedback = !(out[8]^out[3]);

always @(posedge clk) begin
	if (reset) out <= 9'b0 ;
	else if (enable)
	  out <= {out[7:0], linear_feedback};
	else out <= out;
end
endmodule