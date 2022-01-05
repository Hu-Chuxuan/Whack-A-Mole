module gamestate(
   input logic Clk,Reset,isend,
	input logic[9:0] mouseX,mouseY,
	input logic[7:0] mouse_click,
	output logic[19:0] offset,
	output logic isstart,isgame,round_reset);
	
	enum logic[2:0]{
		start,
		game0_start,
		game0_end,
		game,            
		endgame
	}state,next_state;

//logic[7:0] UP_COUNT,UP_COUNT_NEXT;

//logic [9:0] tmp_X,tmp_Y;
		always_ff @(posedge Clk)
		begin
			if(Reset) begin
				state<=start;
				end
			else
			begin
			state<=next_state;
			end
		end

		always_comb begin
			next_state = state;
		//	UP_COUNT_NEXT = UP_COUNT;
			unique case(state)
			start: 
			begin
			  if(mouseX <= 490 && mouseX >= 144 && 
				  mouseY >= 360 && mouseY <= 448 && mouse_click)
			  begin
					next_state = game0_start;
			  end
			end
			
		game0_start:
		begin
		  next_state = game;
		end
		
		game0_end:
		begin
		  next_state = game;
		end
		
		game:
		begin
		  if(isend === 1'b1)
		  begin
			 next_state = endgame;
		  end
			
		end
		
		
		endgame:
		begin
			if( mouseX <= 504 && mouseX >= 152 && 
			    mouseY >= 300 && mouseY <= 412 && mouse_click)
			begin
				next_state = game0_end;
			end
		end
		
		
		default:
		  begin
			 next_state=state;
		  end
		 
		endcase

		isstart = 1'b1;
		isgame = 1'b0;
		round_reset = 1'b0;
		offset=20'd0;
		
	//	mole_PosX_Export = mole_PosX;
	//	mole_PosY_Export = mole_PosY;
		
		case(state)
			start:
			begin
			isstart=1'b1;
			isgame=1'b0;
			offset=20'd0;
			end
			
			game0_start:
			  begin
			   round_reset = 1'b1;
				isstart=1'b1;
			   isgame=1'b0;
			  end
			  
		   game0_end:
			  begin
			   round_reset = 1'b1;
				isstart=1'b0;
			   isgame=1'b0;
			  end
			  
			game:
			 begin
				isgame=1'b1;
				isstart=1'b0;
			 end
			 
			endgame:
			 begin
			   isstart = 1'b0;
				isgame = 1'b0;
				offset=20'd307200;
			 end
			 
			
			default:
			begin
			end
			  
			endcase

	end

endmodule
