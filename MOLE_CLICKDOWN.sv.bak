//module MOLE_CLICKDOWN(input Clk,  frame_clk,
//					input CLICKDOWN_EXPORT2,
//					input [9:0] DrawX, DrawY,
//					input [9:0] TLX_SOIL,TLY_SOIL,
//					input [9:0] mole_PosX, mole_PosY,
//					output logic CLICK_DONE,
//					output logic [23:0] out,
//					output logic ismole,
//					output logic [9:0] mole_PosX_export,mole_PosY_export);
//	 parameter [9:0] Mole_Y_Step = 10'd15;      // Step size on the Y axis        // Ball size	 
//	 logic [18:0] read_address;
//	 logic [23:0] mem[0:7000];
//	 logic [9:0] Y_Min;
//    logic [9:0] Mole_X_Pos, Mole_X_Motion, Mole_Y_Pos, Mole_Y_Motion;
//    logic [9:0] Mole_X_Pos_in, Mole_X_Motion_in, Mole_Y_Pos_in, Mole_Y_Motion_in;
//	 logic [9:0] TLX,TLY;
//	 logic CLICK_DONE_in;
//
//	 assign TLX=mole_PosX;
//	 assign TLY=mole_PosY;
//	 assign Y_Min=TLY_SOIL+10'd70;
//    //////// Do not modify the always_ff blocks. ////////
//    // Detect rising edge of frame_clk
//    logic frame_clk_delayed, frame_clk_rising_edge;
//	 
//    always_ff @ (posedge Clk) begin
//        frame_clk_delayed <= frame_clk;
//        frame_clk_rising_edge <= (frame_clk == 1'b1) && (frame_clk_delayed == 1'b0);
//    end
//    // Update registers
//    always_ff @ (posedge Clk)
//    begin
//        if (CLICKDOWN_EXPORT2)
//        begin
//            Mole_X_Pos <= TLX;
//            Mole_Y_Pos <= TLY;
//            Mole_X_Motion <= 10'd0;
//            Mole_Y_Motion <= 10'd0;
//				CLICK_DONE <= 1'b0;
//			   mole_PosX_export <= TLX;
//				mole_PosY_export <= TLY;
//        end
//        else
//        begin
//            Mole_X_Pos <= Mole_X_Pos_in;
//            Mole_Y_Pos <= Mole_Y_Pos_in;
//            Mole_X_Motion <= Mole_X_Motion_in;
//            Mole_Y_Motion <= Mole_Y_Motion_in;
//				CLICK_DONE <= CLICK_DONE_in;
//				mole_PosX_export <= Mole_X_Pos_in;
//				mole_PosY_export <= Mole_Y_Motion_in;				
//        end
//    end
//    //////// Do not modify the always_ff blocks. ////////
//    
//	 
//    // You need to modify always_comb block.
//    always_comb
//    begin
//			
//        // By default, keep motion and position unchanged
//        Mole_X_Pos_in = Mole_X_Pos;
//        Mole_Y_Pos_in = Mole_Y_Pos;
//        Mole_X_Motion_in = Mole_X_Motion;
//        Mole_Y_Motion_in = Mole_Y_Motion;
//        CLICK_DONE_in = CLICK_DONE;
//
//        // Update position and motion only at rising edge of frame clock
//        if (frame_clk_rising_edge)
//        begin
//		 
//          if(Mole_Y_Pos>=Y_Min )  // Ball is at the bottom edge, BOUNCE!
//              begin 
//				   CLICK_DONE_in=1'b1;
//					Mole_Y_Motion_in = 10'd0;  // 2's complement. 
//					Mole_X_Motion_in = 10'd0;
//					end
//           else 	
//					begin
//						Mole_Y_Motion_in=Mole_Y_Step;
//						Mole_X_Motion_in=Mole_X_Motion;
//					end
//
//            Mole_X_Pos_in = Mole_X_Pos + Mole_X_Motion;
//            Mole_Y_Pos_in = Mole_Y_Pos + Mole_Y_Motion;
//			end
//		end  
//        
//       
//		logic [9:0] DistX,DistY;
//		always_comb
//		begin
//			read_address=19'd0;
//			ismole=0;
//			DistX=DrawX-Mole_X_Pos_in;
//			DistY=DrawY-Mole_Y_Pos_in;
//			if(DistX<10'd100&&DistY<10'd70&&DistX>0 && DistY>0)
//			begin
//				read_address=DistX+DistY*10'd100;
//				ismole=1;
//			end
//		
//		end
//
//
//		initial
//		begin
//			  $readmemh("whacked1.txt",mem);
//			  
//			
//		end
//
//
//		always_ff @ (posedge Clk) begin
//			out<= mem[read_address];
//		end
//endmodule


module  MOLE_CLICKDOWN(
               input Clk,  frame_clk,
               input [9:0] TLX_SOIL,TLY_SOIL,
               input [9:0]   DrawX, DrawY, 
					input CLICKDOWN_EXPORT2,
					input [2:0] choice,
//					output logic [9:0] mole_PosX, mole_PosY,
					output logic ismole,
					output logic [23:0] out,
					output logic CLICK_DONE,
					output logic [9:0] mole_PosX,mole_PosY
				);
   
    parameter [9:0] Mole_Y_Step = 10'd8;      // Step size on the Y axis 
	 
	 logic [18:0] read_address;
	 logic [23:0] mem[0:7000];
	 logic [23:0] mem2[0:7000];
	 logic [9:0] Y_Min;
	 logic CLICK_DONE_in;
    logic [9:0] Mole_X_Pos, Mole_X_Motion, Mole_Y_Pos, Mole_Y_Motion;
    logic [9:0] Mole_X_Pos_in, Mole_X_Motion_in, Mole_Y_Pos_in, Mole_Y_Motion_in;
	 
	 assign Y_Min=TLY_SOIL+10'd90;
    //////// Do not modify the always_ff blocks. ////////
    // Detect rising edge of frame_clk
    logic frame_clk_delayed, frame_clk_rising_edge;
	 
    always_ff @ (posedge Clk) begin
        frame_clk_delayed <= frame_clk;
        frame_clk_rising_edge <= (frame_clk == 1'b1) && (frame_clk_delayed == 1'b0);
    end
    // Update registers
    always_ff @ (posedge Clk)
    begin
        if (CLICKDOWN_EXPORT2)
        begin
            Mole_X_Pos <= TLX_SOIL;
            Mole_Y_Pos <= TLY_SOIL-10'd45;
            Mole_X_Motion <= 10'd0;
            Mole_Y_Motion <= 10'd0;
				CLICK_DONE <= 1'b0;
				mole_PosX <= TLX_SOIL;
				mole_PosY <= TLY_SOIL-10'd50;
        end
        else
        begin
            Mole_X_Pos <= Mole_X_Pos_in;
            Mole_Y_Pos <= Mole_Y_Pos_in;
            Mole_X_Motion <= Mole_X_Motion_in;
            Mole_Y_Motion <= Mole_Y_Motion_in;
				CLICK_DONE <= CLICK_DONE_in;
				mole_PosX <= Mole_X_Pos_in;
				mole_PosY <= Mole_Y_Pos_in;
        end
    end
    //////// Do not modify the always_ff blocks. ////////
    
	 
    // You need to modify always_comb block.
    always_comb
    begin
			
        // By default, keep motion and position unchanged
        Mole_X_Pos_in = Mole_X_Pos;
        Mole_Y_Pos_in = Mole_Y_Pos;
        Mole_X_Motion_in = Mole_X_Motion;
        Mole_Y_Motion_in = Mole_Y_Motion;
		  CLICK_DONE_in = CLICK_DONE;

        // Update position and motion only at rising edge of frame clock
        if (frame_clk_rising_edge)
        begin
		 
            if(Mole_Y_Pos>=Y_Min)  // Ball is at the bottom edge, BOUNCE!
              begin 
					Mole_Y_Motion_in = 10'd0;  // 2's complement. 
					Mole_X_Motion_in = 10'd0;
					CLICK_DONE_in = 1'b1;
			     end
            else 
				begin
				   Mole_Y_Motion_in=Mole_Y_Step;
				   Mole_X_Motion_in=Mole_X_Motion;
				end
            
            // Update the ball's position with its motion
            Mole_X_Pos_in = Mole_X_Pos + Mole_X_Motion;
            Mole_Y_Pos_in = Mole_Y_Pos + Mole_Y_Motion;
				
        end
		end  
        
       
		logic [9:0] DistX,DistY;
		always_comb
			begin
				read_address=19'd0;
				ismole=0;
//				isunder=0;
				DistX=DrawX-Mole_X_Pos_in;
				DistY=DrawY-Mole_Y_Pos_in;
				if(DistX<10'd100&&DistY<10'd70&&DistX>0 && DistY>0)
					begin
						read_address=DistX+DistY*10'd100;
						ismole=1;
					end
//			if(TLY_SOIL<Mole_Y_Pos_in+10'd20)
//			begin
//				isunder=1;
//			end
			end
logic[2:0] index2,index_buffer2;
logic[23:0] out2,out1;


		initial
		begin
			$readmemh("whacked1.txt",mem);
			$readmemh("whacked_bomb.txt",mem2);
		end


		always_ff @ (posedge Clk) 
		begin
			index2<= index_buffer2;
			out1<= mem[read_address];
		end
		assign index_buffer2=mem2[read_address];
	always_comb
	begin
    unique case (index2)
         3'h0: out2=24'hff7f27;
			3'h1: out2=24'hfff200;
			3'h2: out2=24'hffffff;
			
		default : out2 = 24'h000000; //by default, black
	 endcase
	 case(choice)
	 
		3'b011: out=out2;
		3'b110: out=out2;
		default:out=out1;
	 endcase
    end
endmodule


