module mole_state
(
	input logic CLK,
	input logic RESET,
	input logic[9:0] mouseX,mouseY,
	input logic[7:0] mouse_click,
	input logic[9:0] soilX,soilY,
	
	input logic start,

	input logic[9:0] mole_PosX,mole_PosY,
	input logic UP_DONE,
	input logic DOWN_DONE,
	input logic CLICKDOWN_DONE,

	output logic UP_Export,                  //for check if in up state
	output logic DOWN_Export,
	output logic CLICK_Export,
	output logic UP_Export2,                 //for check if initialization is required
	output logic DOWN_Export2,
	output logic CLICK_Export2,
	output logic WAIT_Export
//	output logic[9:0] mole_PosX_Export,mole_PosY_Export
);
enum logic[4:0]{
	WAIT,
	UP,            
	UP2,
	CLICKDOWN,
	CLICKDOWN2,
	DOWN,
	DOWN2
}MOLE_STATE,MOLE_NEXT_STATE;

//logic[7:0] UP_COUNT,UP_COUNT_NEXT;

//logic [9:0] tmp_X,tmp_Y;
always_ff @(posedge CLK)
begin
	if(RESET) begin
		MOLE_STATE<=WAIT;
		end
	else
	begin
	MOLE_STATE<=MOLE_NEXT_STATE;
	end
end

always_comb begin
	MOLE_NEXT_STATE = MOLE_STATE;
//	UP_COUNT_NEXT = UP_COUNT;
	unique case(MOLE_STATE)
	
	WAIT: 
	begin
	  if(start) 
	  begin
	  	   MOLE_NEXT_STATE = UP;
	  end
	end
	
	UP:
	begin
	  MOLE_NEXT_STATE = UP2;
//	  if(UP_DONE === 1'b1)
//	  begin
//	    MOLE_NEXT_STATE = DOWN;
//	  end
//	  if(mouseX-mole_PosX <= 100 && mouseX-mole_PosX >= 0 && 
//	     mouseY-mole_PosY >= 0 && mouseY-mole_PosY <=70 && mouse_click)
//		 begin
//		  MOLE_NEXT_STATE = CLICKDOWN;
//		 end  
     if(mouseX-soilX <= 100 && mouseX-soilX >= 0 && 
	     soilY+50 >= mouseY && soilY-mouseY <=70 && mouse_click)
		 begin
		  MOLE_NEXT_STATE = CLICKDOWN;
		 end 
	end
	
	UP2:
	begin
	  MOLE_NEXT_STATE = UP2;
	  if(UP_DONE === 1'b1)
	  begin
	    MOLE_NEXT_STATE = DOWN;
	  end
//	  if(mouseX-mole_PosX <= 100 && mouseX-mole_PosX >= 0 && 
//	     mouseY-mole_PosY >= 0 && mouseY-mole_PosY <=70 && mouse_click)
//		 begin
//		  MOLE_NEXT_STATE = CLICKDOWN;
//		 end 
     if(mouseX-soilX <= 100 && mouseX-soilX >= 0 && 
	     soilY+50 >= mouseY && soilY-mouseY <= 70 && mouse_click)
		 begin
		  MOLE_NEXT_STATE = CLICKDOWN;
		 end 
	end
	
	DOWN:
	begin
	   MOLE_NEXT_STATE = DOWN2;
//		if(DOWN_DONE === 1'b1)
//		begin
//			MOLE_NEXT_STATE = WAIT;
//		end
//		if(mouseX-mole_PosX <= 100 && mouseX-mole_PosX >= 0 && 
//	      mouseY-mole_PosY >= 0 && mouseY-mole_PosY <=70 && mouse_click)
//		begin
//			MOLE_NEXT_STATE = CLICKDOWN;
//		end

     if(mouseX-soilX <= 100 && mouseX-soilX >= 0 && 
	     soilY+50 >=mouseY && soilY-mouseY <= 70 && mouse_click)
		 begin
		  MOLE_NEXT_STATE = CLICKDOWN;
		 end 
	end
	
	DOWN2:
	begin
	   MOLE_NEXT_STATE = DOWN2;
		if(DOWN_DONE === 1'b1)
		begin
			MOLE_NEXT_STATE = WAIT;
		end
//		if(mouseX-mole_PosX <= 100 && mouseX-mole_PosX >= 0 && 
//	     mouseY-mole_PosY >= 0 && mouseY-mole_PosY <=70 && mouse_click)
//		begin
//			MOLE_NEXT_STATE = CLICKDOWN;
//		end
     if(mouseX-soilX <= 100 && mouseX-soilX >= 0 && 
	     soilY+50 >= mouseY && soilY-mouseY <= 70 && mouse_click)
		 begin
		  MOLE_NEXT_STATE = CLICKDOWN;
		 end 
	end
	
	CLICKDOWN:
	begin
	 MOLE_NEXT_STATE = CLICKDOWN2;
//	 if(CLICKDOWN_DONE === 1'b1)
//	 begin
//	   MOLE_NEXT_STATE = WAIT; 
//	 end
	end
	
	CLICKDOWN2:
	begin
	 MOLE_NEXT_STATE = CLICKDOWN2;
	 if(CLICKDOWN_DONE === 1'b1)
	 begin
	   MOLE_NEXT_STATE = WAIT; 
	 end
	end
	
	default:
	  begin
	    MOLE_NEXT_STATE = WAIT;
	  end
	 
	endcase

   UP_Export = 1'b0;
   DOWN_Export = 1'b0;
   CLICK_Export = 1'b0;
	UP_Export2 = 1'b0;
   DOWN_Export2 = 1'b0;
   CLICK_Export2 = 1'b0;
   WAIT_Export = 1'b1;
//	mole_PosX_Export = mole_PosX;
//	mole_PosY_Export = mole_PosY;
	
	case(MOLE_STATE)
	   WAIT:
		begin
		end
		
		UP:
		 begin
			UP_Export = 1'b1;
			DOWN_Export = 1'b0;
			CLICK_Export = 1'b0;
			UP_Export2 = 1'b1;
			DOWN_Export2 = 1'b0;
			CLICK_Export2 = 1'b0;
			WAIT_Export = 1'b0;
		 end
		 
		UP2:
		 begin
			UP_Export = 1'b1;
			DOWN_Export = 1'b0;
			CLICK_Export = 1'b0;
			UP_Export2 = 1'b0;
			DOWN_Export2 = 1'b0;
			CLICK_Export2 = 1'b0;
			WAIT_Export = 1'b0;
		 end
		
		DOWN:
		 begin
			UP_Export = 1'b0;
			DOWN_Export = 1'b1;
			CLICK_Export = 1'b0;
			UP_Export2 = 1'b0;
			DOWN_Export2 = 1'b1;
			CLICK_Export2 = 1'b0;
			WAIT_Export = 1'b0;
		 end
		 
		 DOWN2:
			begin
				UP_Export = 1'b0;
				DOWN_Export = 1'b1;
				CLICK_Export = 1'b0;
				UP_Export2 = 1'b0;
				DOWN_Export2 = 1'b0;
				CLICK_Export2 = 1'b0;
				WAIT_Export = 1'b0;
			end
		 
		CLICKDOWN:
		  begin
				UP_Export = 1'b0;
				DOWN_Export = 1'b0;
				CLICK_Export = 1'b1;
				UP_Export2 = 1'b0;
				DOWN_Export2 = 1'b0;
				CLICK_Export2 = 1'b1;
				WAIT_Export = 1'b0;
		  end
		  
		CLICKDOWN2:
		  begin
		  		UP_Export = 1'b0;
				DOWN_Export = 1'b0;
				CLICK_Export = 1'b1;
				UP_Export2 = 1'b0;
				DOWN_Export2 = 1'b0;
				CLICK_Export2 = 1'b0;
				WAIT_Export = 1'b0;
		  end
		
		default:
		begin
		end
		  
		endcase

end

endmodule
