`timescale 10ns / 1ns
module Top(
    );
reg [3:0] A [1:4]; // a11 = A[1] a12= A[2] a21 = A[3] a22= A[4]
reg [3:0] B [1:4]; // b11 = B[1] b21= B[2] b12 = B[3] b22= B[4]
reg [7:0] C [1:4]; // c11 = C[1] c12= C[2] c21 = C[3] c22= C[4]
reg clk = 1'b1;
integer i = 0;
initial begin
A[1] = 4'b1011;
A[2] = 4'b1010;
A[3] = 4'b1001;
A[4] = 4'b1101;

B[1] = 4'b1010;
B[2] = 4'b1011;
B[3] = 4'b1111;
B[4] = 4'b1101;


end

always begin
#1
clk = ~clk;
end
always @(posedge(clk))
begin
i       = i+1;
case(i)
1:
begin
C[i]    =   A[i]*B[i];
end
2:
begin
C[i-1]  =   A[i-1]*B[i]+C[i-1];
C[i]    =   A[i-1]*B[i+1];
C[i+1]  =   A[i+1]*B[i-1];
end
3:
begin
C[i-1]  =   A[i-1]*B[i+1]+C[i-1];
C[i]    =   A[i+1]*B[i-1]+C[i]; 
C[i+1]  =   A[i]*B[i];
end
4:
begin
C[i]   =     A[i]*B[i]+C[i];
end
endcase
end



endmodule