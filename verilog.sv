module verilog(output wire [6:0] Q,
input clk,
input R);

integer a;
integer b;
bit clk2;


initial begin
	a = 1;
	b = 0;
end



always @ (posedge clk) 
begin
	b = b+1;
	if(b == 4) begin
		clk2 <= ~clk2;
		b <= 0;
	end
end


always @(posedge clk2)
begin
	if(R) begin
		a = a+1;
		if(a == 7) begin
			a = 1;
		end
	end
	
	
	case(a)
		1: Q <= 7'b1001111;
		2: Q <= 7'b0010010;
		3: Q <= 7'b0000110;
		4: Q <= 7'b1001100;
		5: Q <= 7'b0100100;
		6: Q <= 7'b0100000;
		default: Q <= 7'b1111111;
	endcase
end	
endmodule