module score(input CLICK_DOWN2, CLK, RESET,
             input [2:0] choice,
				 output [7:0] counter
				);
		
      logic [7:0] counter_in;		
		always_ff @ (posedge CLK)
		begin
				if (RESET)
					begin
		            counter<=8'b0;
					end
            else
					begin
				      counter<=counter_in;
               end
      end
		
		always_comb
		begin
		    counter_in = counter;
			 if(CLICK_DOWN2 == 1'b1)
			 begin
			   if(choice === 3'b011 || choice === 3'b110)
				begin
				  counter_in = 8'b0;
				end
				else if (choice === 3'b100)
				begin
				  counter_in = counter + 10;
				end
			   else 
				begin
				  counter_in = counter + 1;
				end
			 end
		end							
endmodule

module board(input [9:0] DrawX, DrawY, 
             input [7:0] counter,
             input CLK,
				 output [23:0] out,
				 output isdigit
				);
		logic [18:0] read_address;
		logic [23:0] out_tmp;
		int distX;
		int distY;
				
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
				
		initial
		begin
//			  $readmemh("timer0.txt",mem0);
//			  $readmemh("timer1.txt",mem1);
//			  $readmemh("timer2.txt",mem2);
//			  $readmemh("timer3.txt",mem3);
//			  $readmemh("timer4.txt",mem4);
//			  $readmemh("timer5.txt",mem5);
//			  $readmemh("timer6.txt",mem6);
//			  $readmemh("timer7.txt",mem7);
//			  $readmemh("timer8.txt",mem8);
//			  $readmemh("timer9.txt",mem9);
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
		
		always_ff @ (posedge CLK) begin
			out<= out_tmp;
		end
		
		always_comb
		begin
		   isdigit = 1'b0;
			out_tmp = 24'b0;
			read_address=19'd0;
			distX = 0;
			distY = 0;
			begin
			  if(DrawX >= 10'd470 && DrawX <= 10'd470+10'd11 && DrawY >= 10'd55 && DrawY <= 10'd55+10'd11)
			    begin
			     distX = DrawX - 10'd470;
				  distY = DrawY - 10'd55;
				  isdigit = 1'b1;
				  read_address = distX + distY*10'd11;
				  case(counter%10) 
				    default : out_tmp = mem0[read_address];
					 1 :       out_tmp = mem1[read_address];
					 2 :       out_tmp = mem2[read_address];
				    3 :       out_tmp = mem3[read_address];
					 4 :       out_tmp = mem4[read_address];
					 5 :       out_tmp = mem5[read_address];
					 6 :       out_tmp = mem6[read_address];
					 7 :       out_tmp = mem7[read_address];
					 8 :       out_tmp = mem8[read_address];
					 9 :       out_tmp = mem9[read_address];
				  endcase
				 end
				else
				 begin
				   if(DrawX >= 10'd470-10'd11 && DrawX <= 10'd470 && DrawY >= 10'd55 && DrawY <= 10'd55+10'd11)
						begin
							distX = DrawX - 10'd470 + 10'd11;
							distY = DrawY - 10'd55;
							isdigit = 1'b1;
							read_address = distX + distY*10'd11;
							case(counter/10) 
								default : out_tmp = mem0[read_address];
								1 :       out_tmp = mem1[read_address];
								2 :       out_tmp = mem2[read_address];
								3 :       out_tmp = mem3[read_address];
								4 :       out_tmp = mem4[read_address];
								5 :       out_tmp = mem5[read_address];
								6 :       out_tmp = mem6[read_address];
								7 :       out_tmp = mem7[read_address];
								8 :       out_tmp = mem8[read_address];
								9 :       out_tmp = mem9[read_address];
								endcase
				   end
					
				 end
			end
		end
				
endmodule