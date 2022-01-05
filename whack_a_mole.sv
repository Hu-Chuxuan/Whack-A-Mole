module whack_a_mole(input Clk, frame_clk,RESET,
							input [9:0] mouseX, mouseY,
							input [7:0] mouse_click,
							input [9:0] DrawX,DrawY,
							input [4:0] rand1,    //for specifying holes
							input [23:0] bg_rgb,
							output [7:0] VGA_R,VGA_G,VGA_B,score_out,
							output [23:0] out_export,
							output up1,up2,start_export,
							output [19:0] offset
							);
		logic [3:0]RAND;
		logic [8:0]start;
		assign start_export=start[0];
		assign up1 = UP_EXPORT[0];
		assign up2 = UP_EXPORT2[0];
		logic wait_export0,wait_export1,wait_export2,wait_export3,wait_export4,wait_export5,wait_export6,wait_export7,wait_export8;
		logic [8:0]CLICK_DONE,UP_EXPORT,UP_EXPORT2,DOWN_EXPORT,DOWN_EXPORT2, CLICKDOWN_EXPORT,CLICKDOWN_EXPORT2,WAIT_EXPORT,UP_DONE,DOWN_DONE,CLICKDONE_DONE,ismole,isunder;
		logic [8:0][23:0]out;
		assign out_export = out[0];
		logic [8:0][9:0]mole_PosX,mole_PosY;
		logic [23:0] out2;


		mole_state mole_state0(.mouseX(mouseX),
		                      .mouseY(mouseY),
									 .mouse_click(mouse_click),
									 .RESET(RESET),
									 .CLK(Clk),
									 .mole_PosX(mole_PosX[0]),
									 .mole_PosY(mole_PosY[0]),
									 .UP_DONE(UP_DONE[0]),
									 .DOWN_DONE(DOWN_DONE[0]),
									 .CLICKDOWN_DONE(CLICK_DONE[0]),
									 .UP_Export(UP_EXPORT[0]),
									 .DOWN_Export(DOWN_EXPORT[0]),
									 .CLICK_Export(CLICKDOWN_EXPORT[0]),
									 .UP_Export2(UP_EXPORT2[0]),
									 .DOWN_Export2(DOWN_EXPORT2[0]),
									 .CLICK_Export2(CLICKDOWN_EXPORT2[0]),
									 .WAIT_Export(wait_export0),
									 .start(start[0]),
									 .soilX(10'd70),
									 .soilY(10'd55)
									 
								);
			
		logic isstart,isgame,round_reset;
								
		gamestate gamestate_instance(
        .Clk(Clk),
		  .Reset(RESET),
		  .isend(isend),
	     .mouseX(mouseX),
		  .mouseY(mouseY),
	     .mouse_click(mouse_click),
	     .isstart(isstart),
		  .isgame(isgame),
		  .round_reset(round_reset),
		  .offset(offset));
		  
		  
		mole_state mole_state1(.soilX(10'd270),.soilY(10'd55),.mouseX(mouseX),.mouseY(mouseY),.mouse_click(mouse_click),.RESET(RESET),.CLK(Clk),.mole_PosX(mole_PosX[1]),.mole_PosY(mole_PosY[1]),.UP_DONE(UP_DONE[1]),.DOWN_DONE(DOWN_DONE[1]),.CLICKDOWN_DONE(CLICK_DONE[1]),.UP_Export(UP_EXPORT[1]),.DOWN_Export(DOWN_EXPORT[1]),.CLICK_Export(CLICKDOWN_EXPORT[1]),.UP_Export2(UP_EXPORT2[1]),.DOWN_Export2(DOWN_EXPORT2[1]),.CLICK_Export2(CLICKDOWN_EXPORT2[1]),.WAIT_Export(wait_export1),.start(start[1]));
		mole_state mole_state2(.soilX(10'd470),.soilY(10'd55),.mouseX(mouseX),.mouseY(mouseY),.mouse_click(mouse_click),.RESET(RESET),.CLK(Clk),.mole_PosX(mole_PosX[2]),.mole_PosY(mole_PosY[2]),.UP_DONE(UP_DONE[2]),.DOWN_DONE(DOWN_DONE[2]),.CLICKDOWN_DONE(CLICK_DONE[2]),.UP_Export(UP_EXPORT[2]),.DOWN_Export(DOWN_EXPORT[2]),.CLICK_Export(CLICKDOWN_EXPORT[2]),.UP_Export2(UP_EXPORT2[2]),.DOWN_Export2(DOWN_EXPORT2[2]),.CLICK_Export2(CLICKDOWN_EXPORT2[2]),.WAIT_Export(wait_export2),.start(start[2]));
		mole_state mole_state3(.soilX(10'd70),.soilY(10'd165),.mouseX(mouseX),.mouseY(mouseY),.mouse_click(mouse_click),.RESET(RESET),.CLK(Clk),.mole_PosX(mole_PosX[3]),.mole_PosY(mole_PosY[3]),.UP_DONE(UP_DONE[3]),.DOWN_DONE(DOWN_DONE[3]),.CLICKDOWN_DONE(CLICK_DONE[3]),.UP_Export(UP_EXPORT[3]),.DOWN_Export(DOWN_EXPORT[3]),.CLICK_Export(CLICKDOWN_EXPORT[3]),.UP_Export2(UP_EXPORT2[3]),.DOWN_Export2(DOWN_EXPORT2[3]),.CLICK_Export2(CLICKDOWN_EXPORT2[3]),.WAIT_Export(wait_export3),.start(start[3]));
		mole_state mole_state4(.soilX(10'd270),.soilY(10'd165),.mouseX(mouseX),.mouseY(mouseY),.mouse_click(mouse_click),.RESET(RESET),.CLK(Clk),.mole_PosX(mole_PosX[4]),.mole_PosY(mole_PosY[4]),.UP_DONE(UP_DONE[4]),.DOWN_DONE(DOWN_DONE[4]),.CLICKDOWN_DONE(CLICK_DONE[4]),.UP_Export(UP_EXPORT[4]),.DOWN_Export(DOWN_EXPORT[4]),.CLICK_Export(CLICKDOWN_EXPORT[4]),.UP_Export2(UP_EXPORT2[4]),.DOWN_Export2(DOWN_EXPORT2[4]),.CLICK_Export2(CLICKDOWN_EXPORT2[4]),.WAIT_Export(wait_export4),.start(start[4]));
		mole_state mole_state5(.soilX(10'd470),.soilY(10'd165),.mouseX(mouseX),.mouseY(mouseY),.mouse_click(mouse_click),.RESET(RESET),.CLK(Clk),.mole_PosX(mole_PosX[5]),.mole_PosY(mole_PosY[5]),.UP_DONE(UP_DONE[5]),.DOWN_DONE(DOWN_DONE[5]),.CLICKDOWN_DONE(CLICK_DONE[5]),.UP_Export(UP_EXPORT[5]),.DOWN_Export(DOWN_EXPORT[5]),.CLICK_Export(CLICKDOWN_EXPORT[5]),.UP_Export2(UP_EXPORT2[5]),.DOWN_Export2(DOWN_EXPORT2[5]),.CLICK_Export2(CLICKDOWN_EXPORT2[5]),.WAIT_Export(wait_export5),.start(start[5]));
		mole_state mole_state6(.soilX(10'd70),.soilY(10'd355),.mouseX(mouseX),.mouseY(mouseY),.mouse_click(mouse_click),.RESET(RESET),.CLK(Clk),.mole_PosX(mole_PosX[6]),.mole_PosY(mole_PosY[6]),.UP_DONE(UP_DONE[6]),.DOWN_DONE(DOWN_DONE[6]),.CLICKDOWN_DONE(CLICK_DONE[6]),.UP_Export(UP_EXPORT[6]),.DOWN_Export(DOWN_EXPORT[6]),.CLICK_Export(CLICKDOWN_EXPORT[6]),.UP_Export2(UP_EXPORT2[6]),.DOWN_Export2(DOWN_EXPORT2[6]),.CLICK_Export2(CLICKDOWN_EXPORT2[6]),.WAIT_Export(wait_export6),.start(start[6]));
		mole_state mole_state7(.soilX(10'd270),.soilY(10'd355),.mouseX(mouseX),.mouseY(mouseY),.mouse_click(mouse_click),.RESET(RESET),.CLK(Clk),.mole_PosX(mole_PosX[7]),.mole_PosY(mole_PosY[7]),.UP_DONE(UP_DONE[7]),.DOWN_DONE(DOWN_DONE[7]),.CLICKDOWN_DONE(CLICK_DONE[7]),.UP_Export(UP_EXPORT[7]),.DOWN_Export(DOWN_EXPORT[7]),.CLICK_Export(CLICKDOWN_EXPORT[7]),.UP_Export2(UP_EXPORT2[7]),.DOWN_Export2(DOWN_EXPORT2[7]),.CLICK_Export2(CLICKDOWN_EXPORT2[7]),.WAIT_Export(wait_export7),.start(start[7]));
		mole_state mole_state8(.soilX(10'd470),.soilY(10'd355),.mouseX(mouseX),.mouseY(mouseY),.mouse_click(mouse_click),.RESET(RESET),.CLK(Clk),.mole_PosX(mole_PosX[8]),.mole_PosY(mole_PosY[8]),.UP_DONE(UP_DONE[8]),.DOWN_DONE(DOWN_DONE[8]),.CLICKDOWN_DONE(CLICK_DONE[8]),.UP_Export(UP_EXPORT[8]),.DOWN_Export(DOWN_EXPORT[8]),.CLICK_Export(CLICKDOWN_EXPORT[8]),.UP_Export2(UP_EXPORT2[8]),.DOWN_Export2(DOWN_EXPORT2[8]),.CLICK_Export2(CLICKDOWN_EXPORT2[8]),.WAIT_Export(wait_export8),.start(start[8]));
		
		
		

		MOLE_SELECT MOLE_Select0(.choice(choice),.Clk(Clk),.DrawX(DrawX),.DrawY(DrawY),.frame_clk(frame_clk),.TLX_SOIL(10'd70),.TLY_SOIL(10'd55),.DOWN_EXPORT2(DOWN_EXPORT2[0]),.UP_EXPORT2(UP_EXPORT2[0]),.UP_EXPORT(UP_EXPORT[0]),.DOWN_EXPORT(DOWN_EXPORT[0]),.CLICK_EXPORT(CLICKDOWN_EXPORT[0]),.CLICK_EXPORT2(CLICKDOWN_EXPORT2[0]),.WAIT_EXPORT(wait_export0),.ismole(ismole[0]),.out(out[0]),.DOWN_DONE(DOWN_DONE[0]),.UP_DONE(UP_DONE[0]),.CLICK_DONE(CLICK_DONE[0]),.mole_PosX_export(mole_PosX[0]),.mole_PosY_export(mole_PosY[0]),.RESET(RESET));
		MOLE_SELECT MOLE_Select1(.choice(choice),.Clk(Clk),.DrawX(DrawX),.DrawY(DrawY),.frame_clk(frame_clk),.TLX_SOIL(10'd270),.TLY_SOIL(10'd55),.DOWN_EXPORT2(DOWN_EXPORT2[1]),.UP_EXPORT2(UP_EXPORT2[1]),.UP_EXPORT(UP_EXPORT[1]),.DOWN_EXPORT(DOWN_EXPORT[1]),.CLICK_EXPORT(CLICKDOWN_EXPORT[1]),.CLICK_EXPORT2(CLICKDOWN_EXPORT2[1]),.WAIT_EXPORT(wait_export1),.ismole(ismole[1]),.out(out[1]),.DOWN_DONE(DOWN_DONE[1]),.UP_DONE(UP_DONE[1]),.CLICK_DONE(CLICK_DONE[1]),.mole_PosX_export(mole_PosX[1]),.mole_PosY_export(mole_PosY[1]),.RESET(RESET));
		MOLE_SELECT MOLE_Select2(.choice(choice),.Clk(Clk),.DrawX(DrawX),.DrawY(DrawY),.frame_clk(frame_clk),.TLX_SOIL(10'd470),.TLY_SOIL(10'd55),.DOWN_EXPORT2(DOWN_EXPORT2[2]),.UP_EXPORT2(UP_EXPORT2[2]),.UP_EXPORT(UP_EXPORT[2]),.DOWN_EXPORT(DOWN_EXPORT[2]),.CLICK_EXPORT(CLICKDOWN_EXPORT[2]),.CLICK_EXPORT2(CLICKDOWN_EXPORT2[2]),.WAIT_EXPORT(wait_export2),.ismole(ismole[2]),.out(out[2]),.DOWN_DONE(DOWN_DONE[2]),.UP_DONE(UP_DONE[2]),.CLICK_DONE(CLICK_DONE[2]),.mole_PosX_export(mole_PosX[2]),.mole_PosY_export(mole_PosY[2]),.RESET(RESET));
		MOLE_SELECT MOLE_Select3(.choice(choice),.Clk(Clk),.DrawX(DrawX),.DrawY(DrawY),.frame_clk(frame_clk),.TLX_SOIL(10'd70),.TLY_SOIL(10'd165),.DOWN_EXPORT2(DOWN_EXPORT2[3]),.UP_EXPORT2(UP_EXPORT2[3]),.UP_EXPORT(UP_EXPORT[3]),.DOWN_EXPORT(DOWN_EXPORT[3]),.CLICK_EXPORT(CLICKDOWN_EXPORT[3]),.CLICK_EXPORT2(CLICKDOWN_EXPORT2[3]),.WAIT_EXPORT(wait_export3),.ismole(ismole[3]),.out(out[3]),.DOWN_DONE(DOWN_DONE[3]),.UP_DONE(UP_DONE[3]),.CLICK_DONE(CLICK_DONE[3]),.mole_PosX_export(mole_PosX[3]),.mole_PosY_export(mole_PosY[3]),.RESET(RESET));
		MOLE_SELECT MOLE_Select4(.choice(choice),.Clk(Clk),.DrawX(DrawX),.DrawY(DrawY),.frame_clk(frame_clk),.TLX_SOIL(10'd270),.TLY_SOIL(10'd165),.DOWN_EXPORT2(DOWN_EXPORT2[4]),.UP_EXPORT2(UP_EXPORT2[4]),.UP_EXPORT(UP_EXPORT[4]),.DOWN_EXPORT(DOWN_EXPORT[4]),.CLICK_EXPORT(CLICKDOWN_EXPORT[4]),.CLICK_EXPORT2(CLICKDOWN_EXPORT2[4]),.WAIT_EXPORT(wait_export4),.ismole(ismole[4]),.out(out[4]),.DOWN_DONE(DOWN_DONE[4]),.UP_DONE(UP_DONE[4]),.CLICK_DONE(CLICK_DONE[4]),.mole_PosX_export(mole_PosX[4]),.mole_PosY_export(mole_PosY[4]),.RESET(RESET));
		MOLE_SELECT MOLE_Select5(.choice(choice),.Clk(Clk),.DrawX(DrawX),.DrawY(DrawY),.frame_clk(frame_clk),.TLX_SOIL(10'd470),.TLY_SOIL(10'd165),.DOWN_EXPORT2(DOWN_EXPORT2[5]),.UP_EXPORT2(UP_EXPORT2[5]),.UP_EXPORT(UP_EXPORT[5]),.DOWN_EXPORT(DOWN_EXPORT[5]),.CLICK_EXPORT(CLICKDOWN_EXPORT[5]),.CLICK_EXPORT2(CLICKDOWN_EXPORT2[5]),.WAIT_EXPORT(wait_export5),.ismole(ismole[5]),.out(out[5]),.DOWN_DONE(DOWN_DONE[5]),.UP_DONE(UP_DONE[5]),.CLICK_DONE(CLICK_DONE[5]),.mole_PosX_export(mole_PosX[5]),.mole_PosY_export(mole_PosY[5]),.RESET(RESET));
		MOLE_SELECT MOLE_Select6(.choice(choice),.Clk(Clk),.DrawX(DrawX),.DrawY(DrawY),.frame_clk(frame_clk),.TLX_SOIL(10'd70),.TLY_SOIL(10'd355),.DOWN_EXPORT2(DOWN_EXPORT2[6]),.UP_EXPORT2(UP_EXPORT2[6]),.UP_EXPORT(UP_EXPORT[6]),.DOWN_EXPORT(DOWN_EXPORT[6]),.CLICK_EXPORT(CLICKDOWN_EXPORT[6]),.CLICK_EXPORT2(CLICKDOWN_EXPORT2[6]),.WAIT_EXPORT(wait_export6),.ismole(ismole[6]),.out(out[6]),.DOWN_DONE(DOWN_DONE[6]),.UP_DONE(UP_DONE[6]),.CLICK_DONE(CLICK_DONE[6]),.mole_PosX_export(mole_PosX[6]),.mole_PosY_export(mole_PosY[6]),.RESET(RESET));
		MOLE_SELECT MOLE_Select7(.choice(choice),.Clk(Clk),.DrawX(DrawX),.DrawY(DrawY),.frame_clk(frame_clk),.TLX_SOIL(10'd270),.TLY_SOIL(10'd355),.DOWN_EXPORT2(DOWN_EXPORT2[7]),.UP_EXPORT2(UP_EXPORT2[7]),.UP_EXPORT(UP_EXPORT[7]),.DOWN_EXPORT(DOWN_EXPORT[7]),.CLICK_EXPORT(CLICKDOWN_EXPORT[7]),.CLICK_EXPORT2(CLICKDOWN_EXPORT2[7]),.WAIT_EXPORT(wait_export7),.ismole(ismole[7]),.out(out[7]),.DOWN_DONE(DOWN_DONE[7]),.UP_DONE(UP_DONE[7]),.CLICK_DONE(CLICK_DONE[7]),.mole_PosX_export(mole_PosX[7]),.mole_PosY_export(mole_PosY[7]),.RESET(RESET));
		MOLE_SELECT MOLE_Select8(.choice(choice),.Clk(Clk),.DrawX(DrawX),.DrawY(DrawY),.frame_clk(frame_clk),.TLX_SOIL(10'd470),.TLY_SOIL(10'd355),.DOWN_EXPORT2(DOWN_EXPORT2[8]),.UP_EXPORT2(UP_EXPORT2[8]),.UP_EXPORT(UP_EXPORT[8]),.DOWN_EXPORT(DOWN_EXPORT[8]),.CLICK_EXPORT(CLICKDOWN_EXPORT[8]),.CLICK_EXPORT2(CLICKDOWN_EXPORT2[8]),.WAIT_EXPORT(wait_export8),.ismole(ismole[8]),.out(out[8]),.DOWN_DONE(DOWN_DONE[8]),.UP_DONE(UP_DONE[8]),.CLICK_DONE(CLICK_DONE[8]),.mole_PosX_export(mole_PosX[8]),.mole_PosY_export(mole_PosY[8]),.RESET(RESET));
		
		soil soil_instance(
		  .Clk(Clk),
		  .DrawX(DrawX),
		  .DrawY(DrawY),
		  .out(out2),
		  .issoil(issoil)
		);
		
		
		score score_instance(.CLICK_DOWN2(CLICKDOWN_EXPORT2[0]|CLICKDOWN_EXPORT2[1]|CLICKDOWN_EXPORT2[2]|CLICKDOWN_EXPORT2[3]|CLICKDOWN_EXPORT2[4]|CLICKDOWN_EXPORT2[5]|CLICKDOWN_EXPORT2[6]|CLICKDOWN_EXPORT2[7]|CLICKDOWN_EXPORT2[8]),
		      .CLK(Clk), 
				.RESET(round_reset),
				.counter(score_out),
				.choice(choice)
				);
				
				
		logic isdigit;
	   logic [23:0] out3;
		board board_instance(
		       .DrawX(DrawX),.DrawY(DrawY), 
             .counter(score_out),
             .CLK(Clk),
				 .out(out3),
				 .isdigit(isdigit)
				);
				
		logic istime,isend;
	   logic [23:0] out4;
		timer timer_instance(.Clk(Clk), 
		                     .Reset(round_reset),
				               .DrawX(DrawX), 
									.DrawY(DrawY),
				               .out(out4), 
				               .isend(isend),
				               .isdigit(istime));
		
//		logic ischuizi;
//		chuizi(.mouse_X(mouseX),
//	        .mouse_Y(mouseY),
//			  .ischuizi(ischuizi), 
//			  .out(out3),
//			  .DrawX(DrawX),
//			  .DrawY(DrawY),
//			  .Clk(Clk));	

	
		color_mapper Color_Mapper(.*,.VGA_VS(frame_clk),.MouseX(mouseX),.MouseY(mouseY),
		  .ismole(ismole[0]||ismole[1]||ismole[2]||ismole[3]||ismole[4]||ismole[5]||ismole[6]||ismole[7]||ismole[8]),
		  .color(out[0]|out[1]|out[2]|out[3]|out[4]|out[5]|out[6]|out[7]|out[8]),.issoil(issoil),
		  .color2(out2),
		  .isdigit(isdigit),
		  .color3(out3),
		  .color4(out4), 
		  .isend(isend),
		  .isstart(isstart),
		  .isgame(isgame),
		  .istime(istime),.down(DOWN_EXPORT[0]||DOWN_EXPORT[1]||DOWN_EXPORT[2]||DOWN_EXPORT[3]||DOWN_EXPORT[4]||DOWN_EXPORT[5]||DOWN_EXPORT[6]||DOWN_EXPORT[7]||DOWN_EXPORT[8]),
		  .clickdown(CLICKDOWN_EXPORT[0]||CLICKDOWN_EXPORT[1]||CLICKDOWN_EXPORT[2]||CLICKDOWN_EXPORT[3]||CLICKDOWN_EXPORT[4]||CLICKDOWN_EXPORT[5]||CLICKDOWN_EXPORT[6]||CLICKDOWN_EXPORT[7]||CLICKDOWN_EXPORT[8]),
		  .up(UP_EXPORT),.bg_rgb(bg_rgb)
		  );
		  
		logic [2:0] choice_in,choice;		
		always_ff @ (posedge Clk)
		begin
				if (RESET)
					begin
		            choice<=3'b0;
					end
            else
					begin
				      choice<=choice_in;
               end
      end
		always_comb
			begin
				choice_in=choice;
				if(UP_EXPORT2 != 9'b0)
			 begin
			   choice_in = choice + 1;
			 end
				if(choice_in===3'b111)
				begin
				choice_in=3'b0;
				end
				if(wait_export0==1'b1&&wait_export1==1'b1&&wait_export2==1'b1&&wait_export3==1'b1&&wait_export4==1'b1&&wait_export5==1'b1&&wait_export6==1'b1&&wait_export7==1'b1&&wait_export8==1'b1)
					RAND=rand1[3:0];
				else
					begin
						RAND=4'b1001;
					end
				case(RAND)
					4'b0000: start=9'b000001000;
					4'b0001: start=9'b000010000;
					4'b0010: start=9'b000100000;
					4'b0011: start=9'b001000000;
					4'b0100: start=9'b010000000;
					4'b0101: start=9'b100000000;
//					4'b0110: start=9'b001000000;
//					4'b0111: start=9'b010000000;
//					4'b1000: start=9'b100000000;
					default: start=9'b000000000;
				endcase
			end

endmodule