`timescale 1ns / 1ps

module FBCPU #(
    parameter ADDRESS_WIDTH = 6,
    parameter DATA_WIDTH = 10
)(
    input clk, 
    input rst, 
    output reg [DATA_WIDTH-1:0] MDRIn, 
    output reg RAMWr, 
    output reg [ADDRESS_WIDTH-1:0] MAR, 
    input [DATA_WIDTH-1:0] MDROut, 
    output reg [5:0] PC
);

reg [DATA_WIDTH - 1:0] IR, IRNext;
reg [5:0] PCNext;
reg [9:0] ACC, ACCNext;
reg [2:0] durum, durumNext;

always@(posedge clk) begin
    durum       <= #1 durumNext;
    PC          <= #1 PCNext;
    IR          <= #1 IRNext;
    ACC         <= #1 ACCNext;
end

always@(*) begin
    durumNext   = durum;
    PCNext      = PC;
    IRNext      = IR;
    ACCNext     = ACC;
    MAR         = 0;
    RAMWr       = 0;
    MDRIn       = 0;
    
    if(rst) begin
        durumNext   = 0;
        PCNext      = 0;
        MAR         = 0;
        RAMWr       = 0;
        IRNext      = 0;
        ACCNext     = 0;
        MDRIn       = 0;
    end else begin
        case(durum)
            0: begin
                MAR = PC;
                RAMWr = 0;
                durumNext = durum + 1;
            end
            
            1: begin
                IRNext = MDROut;
                PCNext = PC + 1;
                durumNext = durum + 1;
            end
            
            2: begin
                // Durum 2 tasarimi buraya geliştirilecek
            end
            
            3: begin
                // Durum 3 tasarimi buraya geliştirilecek
            end
			
            4: begin
				// Durum 4 tasarimi buraya geliştirilecek
            end
        endcase
    end
end

endmodule
