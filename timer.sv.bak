//module timer(input Clk, Reset,
//				 input [9:0]DrawX, DrawY,
//				 output logic [7:0]out, 
//				 output logic isend,isdigit);
//	int counter,counter_in;
//	int counter2,counter2_in;
//	int digit,digit_in;
//	int qian,hou,qian_in,hou_in;
////	logic [23:0]out;
////	logic isend,isdigit;
//	logic [18:0] read_address;
//	logic [9:0]DistX,DistY;
//	logic [23:0] mem0[0:7000];
//	   logic [23:0] mem1[0:7000];
//		logic [0] mem2[0:7000];
//	   logic [7:0] mem3[0:7000];
//		logic [7:0] mem4[0:7000];
//	   logic [7:0] mem5[0:7000];
//		logic [7:0] mem6[0:7000];
//		logic [7:0] mem7[0:7000];
//	   logic [7:0] mem8[0:7000];
//		logic [7:0] mem9[0:7000];
//	always_ff @ (posedge Clk)
//    begin
//	  if(Reset)
//	    begin
//            counter <= 0;
//				counter2<= 0;
//				digit<=0;
//				qian<=0;
//				hou<=0;
//		 end
//      
//     else
//        begin
//           counter<=counter_in;
//			  counter2<=counter2_in;
//			  digit<=digit_in;
//			  qian<=qian_in;
//			  hou<=hou_in;
//				//COUNT<=COUNT_IN;
//        end
//    end
//	always_comb
//    begin
//		
//		read_address=19'd0;
//		counter_in= counter+1;
//		counter2_in= counter2+1;
//		isend=1'b0;
//		digit_in=digit;
//		qian_in=qian;
//		hou_in=hou;
//		if(counter2==50000000||counter2==0)
//		begin
//		   digit_in=counter/50000000;
//		   if(digit_in%10==0)
//		   begin
//		     qian_in=3-digit_in/10;
//			  hou_in=0;
//		   end
//			else
//			begin
//				qian_in=2-digit_in/10;
//				hou_in=10-digit_in%10;
//			end
//			counter2_in=0;
//		end
//		if (counter_in>=1500000000)
//		begin
//			isend=1'b1;
//			counter_in=1500000000;
//		end
//		
//    end
//	 initial
//		begin
////			  $readmemh("zero.txt",mem0);
////			  $readmemh("one.txt",mem1);
////			  $readmemh("two.txt",mem2);
////			  $readmemh("three.txt",mem3);
////			  $readmemh("four.txt",mem4);
////			  $readmemh("five.txt",mem5);
////			  $readmemh("six.txt",mem6);
////			  $readmemh("seven.txt",mem7);
////			  $readmemh("eight.txt",mem8);
////			  $readmemh("nine.txt",mem9);
//			  $readmemh("0.txt",mem0);
//			  $readmemh("1.txt",mem1);
//			  $readmemh("2.txt",mem2);
//			  $readmemh("3.txt",mem3);
//			  $readmemh("4.txt",mem4);
//			  $readmemh("5.txt",mem5);
//			  $readmemh("6.txt",mem6);
//			  $readmemh("7.txt",mem7);
//			  $readmemh("8.txt",mem8);
//			  $readmemh("9.txt",mem9);
//		end
//			always_comb
//		begin
//		   isdigit = 1'b0;
//			out = 24'b0;
//			read_address=19'd0;
//			DistX = 10'd0;
//			DistY = 10'd0;
//			begin
//			  if(DrawX >= 10'd100 && DrawX <= 10'd100+10'd11 && DrawY >= 10'd55 && DrawY <= 10'd55+10'd11)
//			    begin
//			     DistX = DrawX - 10'd100;
//				  DistY = DrawY - 10'd55;
//				  isdigit = 1'b1;
//				  read_address = DistX + DistY*10'd30;
//				  case(qian) 
//				    default : out = mem0[read_address];
//					 1 :       out = mem1[read_address];
//					 2 :       out = mem2[read_address];
//				    3 :       out = mem3[read_address];
//					 4 :       out = mem4[read_address];
//					 5 :       out = mem5[read_address];
//					 6 :       out = mem6[read_address];
//					 7 :       out = mem7[read_address];
//					 8 :       out = mem8[read_address];
//					 9 :       out = mem9[read_address];
//				  endcase
//				 end
//				else
//				 begin
//				   if(DrawX >= 10'd100+10'd11 && DrawX <= 10'd100+10'd22 && DrawY >= 10'd55 && DrawY <= 10'd55+10'd11)
//						begin
//							DistX = DrawX - 10'd100 - 10'd11;
//							DistY = DrawY - 10'd11;
//							isdigit = 1'b1;
//							read_address = DistX + DistY*10'd11;
//							case(hou) 
//								default : out = mem0[read_address];
//								1 :       out = mem1[read_address];
//								2 :       out = mem2[read_address];
//								3 :       out = mem3[read_address];
//								4 :       out = mem4[read_address];
//								5 :       out = mem5[read_address];
//								6 :       out = mem6[read_address];
//								7 :       out = mem7[read_address];
//								8 :       out = mem8[read_address];
//								9 :       out = mem9[read_address];
//								endcase
//				   end
//					
//				 end
//			end
//		end
//
//	 
//endmodule

module timer(input Clk, Reset,
				 input [9:0]DrawX, DrawY,
				 output logic [23:0]out, 
				 output logic isend,isdigit);
	int counter,counter_in;
	int counter2,counter2_in;
	int digit,digit_in;
	int qian,hou,qian_in,hou_in;
//	logic [23:0]out;
//	logic isend,isdigit;
	logic [18:0] read_address;
	logic [9:0]DistX,DistY;
	logic [23:0] mem0[0:7000];
	   logic [23:0] mem1[0:7000];
		logic [23:0] mem2[0:7000];
	   logic [23:0] mem3[0:7000];
		logic [23:0] mem4[0:7000];
	   logic [23:0] mem5[0:7000];
		logic [23:0] mem6[0:7000];
		logic [23:0] mem7[0:7000];
	   logic [23:0] mem8[0:7000];
		logic [23:0] mem9[0:7000];
	always_ff @ (posedge Clk)
    begin
	  if(Reset)
	    begin
            counter <= 0;
				counter2<= 0;
				digit<=0;
				qian<=0;
				hou<=0;
		 end
      
     else
        begin
           counter<=counter_in;
			  counter2<=counter2_in;
			  digit<=digit_in;
			  qian<=qian_in;
			  hou<=hou_in;
				//COUNT<=COUNT_IN;
        end
    end
	always_comb
    begin
		
		read_address=19'd0;
		counter_in= counter+1;
		counter2_in= counter2+1;
		isend=1'b0;
		digit_in=digit;
		qian_in=qian;
		hou_in=hou;
		if(counter2==50000000||counter2==0)
		begin
		   digit_in=counter/50000000;
		   if(digit_in%10==0)
		   begin
		     qian_in=3-digit_in/10;
			  hou_in=0;
		   end
			else
			begin
				qian_in=2-digit_in/10;
				hou_in=10-digit_in%10;
			end
			counter2_in=0;
		end
		if (counter_in>=1500000000)
		begin
			isend=1'b1;
			counter_in=1500000000;
		end
		
    end
	 initial
		begin
//			  $readmemh("zero.txt",mem0);
//			  $readmemh("one.txt",mem1);
//			  $readmemh("two.txt",mem2);
//			  $readmemh("three.txt",mem3);
//			  $readmemh("four.txt",mem4);
//			  $readmemh("five.txt",mem5);
//			  $readmemh("six.txt",mem6);
//			  $readmemh("seven.txt",mem7);
//			  $readmemh("eight.txt",mem8);
//			  $readmemh("nine.txt",mem9);
			  $readmemh("0.txt",mem0);
			  $readmemh("1.txt",mem1);
			  $readmemh("2.txt",mem2);
			  $readmemh("3.txt",mem3);
			  $readmemh("4.txt",mem4);
			  $readmemh("5.txt",mem5);
			  $readmemh("6.txt",mem6);
			  $readmemh("7.txt",mem7);
			  $readmemh("8.txt",mem8);
			  $readmemh("9.txt",mem9);
		end
			always_comb
		begin
		   isdigit = 1'b0;
			out = 24'b0;
			read_address=19'd0;
			DistX = 10'd0;
			DistY = 10'd0;
			begin
			  if(DrawX >= 10'd100 && DrawX <= 10'd100+10'd11 && DrawY >= 10'd55 && DrawY <= 10'd55+10'd11)
			    begin
			     DistX = DrawX - 10'd100;
				  DistY = DrawY - 10'd55;
				  isdigit = 1'b1;
				  read_address = DistX + DistY*10'd11;
				  case(qian) 
				    default : out = mem0[read_address];
					 1 :       out = mem1[read_address];
					 2 :       out = mem2[read_address];
				    3 :       out = mem3[read_address];
					 4 :       out = mem4[read_address];
					 5 :       out = mem5[read_address];
					 6 :       out = mem6[read_address];
					 7 :       out = mem7[read_address];
					 8 :       out = mem8[read_address];
					 9 :       out = mem9[read_address];
				  endcase
				 end
				else
				 begin
				   if(DrawX >= 10'd100+10'd11 && DrawX <= 10'd100+10'd22 && DrawY >= 10'd55 && DrawY <= 10'd55+10'd11)
						begin
							DistX = DrawX - 10'd100 - 10'd11;
							DistY = DrawY - 10'd55;
							isdigit = 1'b1;
							read_address = DistX + DistY*10'd11;
							case(hou) 
								default : out = mem0[read_address];
								1 :       out = mem1[read_address];
								2 :       out = mem2[read_address];
								3 :       out = mem3[read_address];
								4 :       out = mem4[read_address];
								5 :       out = mem5[read_address];
								6 :       out = mem6[read_address];
								7 :       out = mem7[read_address];
								8 :       out = mem8[read_address];
								9 :       out = mem9[read_address];
								endcase
				   end
					
				 end
			end
		end

	 
endmodule
