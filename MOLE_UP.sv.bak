					
module MOLE_UP(input Clk,  frame_clk,RESET,
					input UP_EXPORT2,
					input [9:0] DrawX, DrawY,
					input [2:0]choice,
					input [9:0] TLX_SOIL,TLY_SOIL,
					output logic [9:0] mole_PosX, mole_PosY,
					output logic UP_DONE,
					output logic [23:0] out,
					output logic ismole
				);
				//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Po-Han Huang  12-08-2017                               --
//    Spring 2018 Distribution                                           --
//                                                                       --
//    For use with ECE 385 Lab 8                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------

    
//    parameter [9:0] TLX= 10'd300;  // Center position on the X axis
//    parameter [9:0] TLY = 10'd100;  // Center position on the Y axis
//    parameter [9:0] XMin = 10'd0;       // Leftmost point on the X axis
//    parameter [9:0] XMax = 10'd639;     // Rightmost point on the X axis
//    parameter [9:0] YMin = 10'd0;       // Topmost point on the Y axis
//    parameter [9:0] YMax = 10'd479;     // Bottommost point on the Y axis
//    parameter [9:0] MOLE_X_Step = 10'd5;      // Step size on the X axis
//    parameter [9:0] MOLE_Y_Step = 10'd1;      // Step size on the Y axis        // Ball size
////    parameter [9:0] TLX_SOIL=10'd300;
////	 parameter [9:0] TLY_SOIL=10'd270;
//	 
//	 logic [18:0] read_address;
//	 logic [18:0] read_address2;
//	 logic [23:0] mem[0:7000];
//	 logic [23:0] mem2[0:7000];
//	 logic [9:0] Y_DIST;
//    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion;
//    logic [9:0] Ball_X_Pos_in, Ball_X_Motion_in, Ball_Y_Pos_in, Ball_Y_Motion_in;
//	 
//	 assign Y_DIST=10'd300;
//    //////// Do not modify the always_ff blocks. ////////
//    // Detect rising edge of frame_clk
//    logic frame_clk_delayed, frame_clk_rising_edge;
//	 assign UP_DONE = 1'b0;
//	 assign mole_PosX = TLX;
//	 assign mole_PosY = TLY;
//    always_ff @ (posedge Clk) begin
//        frame_clk_delayed <= frame_clk;
//        frame_clk_rising_edge <= (frame_clk == 1'b1) && (frame_clk_delayed == 1'b0);
//    end
//    // Update registers
//    always_ff @ (posedge Clk)
//    begin
//        if (RESET)
//        begin
//            Ball_X_Pos <= TLX;
//            Ball_Y_Pos <= TLY;
//            Ball_X_Motion <= 10'd0;
//            Ball_Y_Motion <= 10'd0;
//		   // COUNT<=8'b000;
//			
//        end
//        else
//        begin
//            Ball_X_Pos <= Ball_X_Pos_in;
//            Ball_Y_Pos <= Ball_Y_Pos_in;
//            Ball_X_Motion <= Ball_X_Motion_in;
//            Ball_Y_Motion <= Ball_Y_Motion_in;
//				//COUNT<=COUNT_IN;
//        end
//    end
//    //////// Do not modify the always_ff blocks. ////////
//    
//    // You need to modify always_comb block.
//    always_comb
//    begin
//			
//        // By default, keep motion and position unchanged
//        Ball_X_Pos_in = Ball_X_Pos;
//        Ball_Y_Pos_in = Ball_Y_Pos;
//        Ball_X_Motion_in = Ball_X_Motion;
//        Ball_Y_Motion_in = Ball_Y_Motion;
//       // COUNT_IN=COUNT;
//
//        // Update position and motion only at rising edge of frame clock
//        if (frame_clk_rising_edge)
//        begin
//		 
//            if(Ball_Y_Pos>=Y_DIST )  // Ball is at the bottom edge, BOUNCE!
//              begin 
//					Ball_Y_Motion_in = 10'd0;  // 2's complement. 
//					Ball_X_Motion_in = 10'd0;
//               //COUNT_IN=8'h10;
//			  end
//            else 
//				begin
//				//COUNT_IN=COUNT+8'b001;
//				Ball_Y_Motion_in=MOLE_Y_Step;
//				Ball_X_Motion_in=Ball_X_Motion;
//				end
//            
//        
//            // Update the ball's position with its motion
//            Ball_X_Pos_in = Ball_X_Pos + Ball_X_Motion;
//            Ball_Y_Pos_in = Ball_Y_Pos + Ball_Y_Motion;
//				
//        end
//		end  
//        
//       
//		logic [9:0] DistX,DistY;
////		logic [9:0]	DistX_SOIL, DistY_SOIL;
//		always_comb
//		begin
//		read_address=19'd0;
////		read_address2=19'd0;
//		ismole=0;
//
//		DistX=DrawX-Ball_X_Pos_in;
//		DistY=DrawY-Ball_Y_Pos_in;
////		DistX_SOIL=DrawX-TLX_SOIL;
////		DistY_SOIL=DrawY-TLY_SOIL;
//		if(DistX<10'd100&&DistY<10'd70&&DistX>0 && DistY>0)
//		begin
//			read_address=DistX+DistY*10'd100;
//			ismole=1;
//			end
//
//
//			end
//
//
//
//		initial
//		begin
//			  $readmemh("mole2.txt",mem);
//
//			
//		end
//
//
//		always_ff @ (posedge Clk) begin
//			out<= mem[read_address];
//
//		end
//endmodule


// mem has width of 3 bits and a total of 400 addresses


    parameter [9:0] Mole_Y_Step = 10'd3;      // Step size on the Y axis        // Ball size	 
	 logic [18:0] read_address;
	 logic [18:0] read_address3;
	 logic [2:0] mem[0:7000];
	 logic [2:0] mem3[0:7000];
	 logic [2:0] mem9[0:7000];
	 logic [2:0] memegg[0:7000];
	 logic [2:0] mem4[0:7000];
	 logic [2:0] membomb[0:7000];
	 logic [9:0] Y_MAX;
    logic [9:0] Mole_X_Pos, Mole_X_Motion, Mole_Y_Pos, Mole_Y_Motion;
    logic [9:0] Mole_X_Pos_in, Mole_X_Motion_in, Mole_Y_Pos_in, Mole_Y_Motion_in;
	 logic [9:0] TLX,TLY;
	 logic UP_DONE_in;
	 assign TLX=TLX_SOIL;
	 assign TLY=TLY_SOIL+10'd50;
	 assign Y_MAX=TLY_SOIL-10'd45;
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
        if (UP_EXPORT2)
        begin
            Mole_X_Pos <= TLX;
            Mole_Y_Pos <= TLY;
            Mole_X_Motion <= 10'd0;
            Mole_Y_Motion <= (~(Mole_Y_Step) + 1'b1);
				UP_DONE <= 1'b0;
				mole_PosX <= TLX;
				mole_PosY <= TLY;
			
        end
        else
        begin
            Mole_X_Pos <= Mole_X_Pos_in;
            Mole_Y_Pos <= Mole_Y_Pos_in;
            Mole_X_Motion <= Mole_X_Motion_in;
            Mole_Y_Motion <= Mole_Y_Motion_in;
				UP_DONE <= UP_DONE_in;
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
        Mole_Y_Motion_in = (~(Mole_Y_Step) + 1'b1);
		  UP_DONE_in = UP_DONE;

        // Update position and motion only at rising edge of frame clock
        if (frame_clk_rising_edge)
        begin
		 
           if(Mole_Y_Pos<=Y_MAX)  // Ball is at the bottom edge, BOUNCE!
             begin 
					UP_DONE_in = 1'b1;
					Mole_Y_Motion_in = 10'd0;  // 2's complement. 
					Mole_X_Motion_in = 10'd0;
				end
           else 
				begin
					Mole_Y_Motion_in=(~(Mole_Y_Step) + 1'b1);
					Mole_X_Motion_in=Mole_X_Motion;
				end
            
            // Update the ball's position with its motion
            Mole_X_Pos_in = Mole_X_Pos + Mole_X_Motion;
            Mole_Y_Pos_in = Mole_Y_Pos +Mole_Y_Motion;
		 end
	 end  
        
       
		logic [9:0] DistX,DistY;
		always_comb
		begin
		read_address=19'd0;
		ismole=0;
//		isunder=0;
		DistX=DrawX-Mole_X_Pos_in;
		DistY=DrawY-Mole_Y_Pos_in;
		if(DistX<10'd100&&DistY<10'd70&&DistX>0 && DistY>0)
		begin
			read_address=DistX+DistY*10'd100;
			ismole=1;
			end
//		if(TLY_SOIL<Mole_Y_Pos_in+10'd20)
//		begin
//		isunder=1;
//		end
		
		end



		logic[2:0] index2,index_buffer2;
		logic[2:0] index3,index_buffer3;
		logic[2:0] index9,index_buffer9;
		logic[2:0] indexegg,index_bufferegg;
		logic[2:0] index4,index_buffer4;
		logic[2:0] indexbomb,index_bufferbomb;
		logic[23:0] out2,out3,out9,outegg,out4,outbomb;

	initial
	begin
	$readmemh("mole2.txt", mem);
	$readmemh("mole3.txt", mem3);
	$readmemh("mole9.txt", mem9);
	$readmemh("moleegg.txt", memegg);
	$readmemh("mole4.txt", mem4);
	$readmemh("bombmole.txt", membomb);
	end
	always_ff @ (posedge Clk) begin
		index2<= index_buffer2;
		index3<= index_buffer3;
		index9<= index_buffer9;
		indexegg<= index_bufferegg;
		index4<= index_buffer4;
		indexbomb<= index_bufferbomb;
	end

	assign index_buffer2=mem[read_address];
	assign index_buffer3=mem3[read_address];
	assign index_buffer9=mem9[read_address];
	assign index_bufferegg=memegg[read_address];
	assign index_buffer4=mem4[read_address];
	assign index_bufferbomb=membomb[read_address];
	always_comb
	begin
    unique case (index2)
         3'h0: out2=24'hbda17a;
			3'h1: out2=24'hbba17c;
			3'h2: out2=24'hee9e83;
			3'h3: out2=24'hfaece9;
			3'h4: out2=24'h030000;
			3'h5: out2=24'hfffae3;
			3'h6: out2=24'hffffff;
		default : out2 = 24'h000000; //by default, black
	 endcase
	 unique case (index3)
         3'h0: out3=24'h008040;
			3'h1: out3=24'h000000;
			3'h2: out3=24'hed1c24;
			3'h3: out3=24'hffffff;
			3'h4: out3=24'hec9d8c;
			3'h5: out3=24'hfbedea;
			3'h6: out3=24'hfffae3;
		default : out3 = 24'h000000; //by default, black
		endcase
	  unique case (index9)
			 3'h0:out9=24'hbea27b;
			 3'h1:out9=24'ha78c6e;
			 3'h2:out9=24'h6b5434;
			 3'h3:out9=24'hfeffff;
			 3'h4:out9=24'h000000;
			 3'h5:out9=24'hffffff;
			 3'h6:out9=24'hff80a9;
			 3'h7:out9=24'hff286f;
		default : out9 = 24'h000000; //by default, black
		endcase
	 unique case (indexegg)
        3'h0:outegg=24'hed1c24;
        3'h1:outegg=24'ha98c6e;
        3'h2:outegg=24'hbda17a;
        3'h3:outegg=24'hfff200;
        3'h4:outegg=24'hf09f8a;
        3'h5:outegg=24'hfdeee7;
        3'h6:outegg=24'h000000;
        3'h7:outegg=24'hffffff;
		default : outegg = 24'h000000; //by default, black
		endcase
		unique case (index4)
        3'h0:out4=24'h880015;
			3'h1:out4=24'hed1c24;
			3'h2:out4=24'hfff200;
			3'h3:out4=24'hffffff;
			3'h4:out4=24'h000000;
			3'h5:out4=24'h5c3d2c;
			3'h6:out4=24'h7092be;
			3'h7:out4=24'hf3a291;

		default : out4 = 24'h000000; //by default, black
		endcase
		unique case (indexbomb)
		3'h0:outbomb=24'h000000;
		3'h1:outbomb=24'hfff200;
		3'h2:outbomb=24'hff7f27;
		3'h3:outbomb=24'hb97a57;
		3'h4:outbomb=24'hffffff;
		3'h5:outbomb=24'hbda17a;
		3'h6:outbomb=24'haa8b6e;
		3'h7:outbomb=24'hf3a291;
		default : outbomb = 24'h000000; 
		endcase
	 case(choice)
	 
		3'b000: out=out2;
		3'b001: out=out3;
		3'b010: out=out9;
		3'b011: out=outbomb;
		3'b100: out=outegg;
		3'b101: out=out4;
		3'b110: out=outbomb;
		default:out=out2;
	 endcase
    end
endmodule