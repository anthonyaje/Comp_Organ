//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      Luke
//----------------------------------------------
//Date:        2010/8/16
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o,
	//***************************************************
	BranchType_o,
	Jump_o,
	MemRead_o,
	MemWrite_o,
	MemtoReg_o
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output [1:0]   ALUSrc_o;
output         RegDst_o;
output         Branch_o;
output reg	BranchType_o;
output reg	Jump_o;
output reg	MemRead_o;
output reg	MemWrite_o;
output reg	MemtoReg_o;
 
//Internal Signals
reg    [3-1:0] ALU_op_o;
reg    [1:0]   ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;

//Parameter


//Main function

always@(*)begin
	case(instr_op_i)
		6'b000000:begin			//R-type including the MULTIPLICATION
			ALU_op_o <= 3'b010;
        end
		6'b001000:begin			//ADDI			
			ALU_op_o <= 3'b100;
	    end
		6'b001101:begin			//ORI
		    ALU_op_o <= 3'b101;
        end
		6'b000100:begin			//BEQ
		    ALU_op_o <= 3'b001;
        end
		6'b100011:begin			//lw
		    ALU_op_o <= 3'b000;
        end		
		6'b101011:begin			//sw
		    ALU_op_o <= 3'b000;
        end
		6'b000010:begin			//jump
		    ALU_op_o <= 3'b000;	//or X
        end
	endcase
end
always@(*)begin
	case(instr_op_i)
		6'b000000:ALUSrc_o <= 2'b00;
		6'b001000:ALUSrc_o <= 2'b01;
		6'b001101:ALUSrc_o <= 2'b10;
		6'b000100:ALUSrc_o <= 2'b00;
		6'b100011: ALUSrc_o <= 2'b01;
		6'b101011: ALUSrc_o <= 2'b01;
		6'b000010: ALUSrc_o <= 2'b00;	//or X
	endcase
end

always@(*)begin
	case(instr_op_i)
		6'b000000:RegWrite_o <= 1;
		6'b001000:RegWrite_o <= 1;
		6'b001101:RegWrite_o <= 1;
		6'b000100:RegWrite_o <= 0;
		6'b100011:RegWrite_o <= 1;
		6'b101011:RegWrite_o <= 0;
		6'b000010:RegWrite_o <= 0;	
	endcase
end
always@(*)begin
	case(instr_op_i)
		6'b000000:RegDst_o <= 1;
		6'b001000:RegDst_o <= 0;
		6'b001101:RegDst_o <= 0;
		6'b000100:RegDst_o <= 0;
		6'b100011:RegDst_o <= 0;
		6'b101011:RegDst_o <= 0;		//or X
		6'b000010:RegDst_o <= 0;		//or X
	endcase
end
always@(*)begin
	case(instr_op_i)
		6'b000000:Branch_o <= 0;
		6'b001000:Branch_o <= 0;
		6'b001101:Branch_o <= 0;
		6'b000100:Branch_o <= 1;
		6'b100011:Branch_o <= 0;
		6'b101011:Branch_o <= 0;
		6'b000010:Branch_o <= 0;			
	endcase
end
always@(*)begin
	case(instr_op_i)
		6'b000000:BranchType_o <=0;
		6'b001000:BranchType_o <=0; 
		6'b001101:BranchType_o <=0;
		6'b000100:BranchType_o <=0;
		6'b100011:BranchType_o <=0; 
		6'b101011:BranchType_o <=0;
		6'b000010:BranchType_o <=0;
	endcase
end
always@(*)begin
	case(instr_op_i)
		6'b000000:Jump_o <= 0;
		6'b001000:Jump_o <= 0;
		6'b001101:Jump_o <= 0;
		6'b000100:Jump_o <= 0;
		6'b100011:Jump_o <= 0;
		6'b101011:Jump_o <= 0;
		6'b000010:Jump_o <= 1;
	endcase
end
always@(*)begin
	case(instr_op_i)
		6'b000000:MemRead_o <= 0;
		6'b001000:MemRead_o <= 0;
		6'b001101:MemRead_o <= 0;
		6'b000100:MemRead_o <= 0;
		6'b100011:MemRead_o <= 1;
		6'b101011:MemRead_o <= 0;
		6'b000010:MemRead_o <= 0;
	endcase
end
always@(*)begin
	case(instr_op_i)
		6'b000000:MemWrite_o <= 0;
		6'b001000:MemWrite_o <= 0;
		6'b001101:MemWrite_o <= 0;
		6'b000100:MemWrite_o <= 0;
		6'b100011:MemWrite_o <= 0;	
		6'b101011:MemWrite_o <= 1;
		6'b000010:MemWrite_o <= 0;
	endcase
end
always@(*)begin
	case(instr_op_i)
		6'b000000:MemtoReg_o	<= 0;		
		6'b001000:MemtoReg_o	<= 0;		
		6'b001101:MemtoReg_o	<= 0;		
		6'b000100:MemtoReg_o	<= 0;		
		6'b100011:MemtoReg_o	<= 1;			
		6'b101011:MemtoReg_o	<= 0;    //or X	
		6'b000010:MemtoReg_o	<= 0;    		
	endcase
end



endmodule





                    
                    