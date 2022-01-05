module soil(
      input Clk,                        // 50 MHz clock           
      input [9:0]   DrawX, DrawY,       // Current pixel coordinates
      output logic [23:0] out,          // color of the pixel
		output logic  issoil              // if the pixel is in soil
);

//dealing with the output color
      logic[23:0] out_tmp;
		logic [18:0] read_address;
		logic [23:0] mem [0:7000];
		
		initial
		begin
			$readmemh("tu.txt",mem);
		end

		always_ff @ (posedge Clk) begin
			out_tmp<= mem[read_address];
		end
		
		always_comb
		begin
		   issoil = 1'b0;
			out = 24'b0;
			read_address=19'd0;
			begin
			  if(
//			     (DrawX >= 10'd70 && DrawX <= 10'd70+10'd100 && DrawY >= 10'd55 && DrawY <= 10'd55+10'd68)     ||
//				  (DrawX >= 10'd270 && DrawX <= 10'd270+10'd100 && DrawY >= 10'd55 && DrawY <= 10'd55+10'd68)   ||
//				  (DrawX >= 10'd470 && DrawX <= 10'd470+10'd100 && DrawY >= 10'd55 && DrawY <= 10'd55+10'd68)   ||
				  (DrawX >= 10'd70 && DrawX <= 10'd70+10'd100 && DrawY >= 10'd165 && DrawY <= 10'd165+10'd68)   ||
				  (DrawX >= 10'd270 && DrawX <= 10'd270+10'd100 && DrawY >= 10'd165 && DrawY <= 10'd165+10'd68) ||
				  (DrawX >= 10'd470 && DrawX <= 10'd470+10'd100 && DrawY >= 10'd165 && DrawY <= 10'd165+10'd68) ||
				  (DrawX >= 10'd70 && DrawX <= 10'd70+10'd100 && DrawY >= 10'd355 && DrawY <= 10'd355+10'd68)   ||
				  (DrawX >= 10'd270 && DrawX <= 10'd270+10'd100 && DrawY >= 10'd355 && DrawY <= 10'd355+10'd68) ||
				  (DrawX >= 10'd470 && DrawX <= 10'd470+10'd100 && DrawY >= 10'd355 && DrawY <= 10'd355+10'd68)
				  )
				  begin
					issoil = 1'b1;
//					if(DrawX >= 10'd70 && DrawX <= 10'd70+10'd100 && DrawY >= 10'd55 && DrawY <= 10'd55+10'd68)
//						begin
//					    read_address = (DrawX - 10'd70)+(DrawY - 10'd55)*10'd100;
//						end
//					if(DrawX >= 10'd270 && DrawX <= 10'd270+10'd100 && DrawY >= 10'd55 && DrawY <= 10'd55+10'd68)
//						begin
//					    read_address = (DrawX - 10'd270)+(DrawY - 10'd55)*10'd100;
//						end
//					if(DrawX >= 10'd470 && DrawX <= 10'd470+10'd100 && DrawY >= 10'd55 && DrawY <= 10'd55+10'd68)
//						begin
//					    read_address = (DrawX - 10'd470)+(DrawY - 10'd55)*10'd100;
//						end
					if(DrawX >= 10'd70 && DrawX <= 10'd70+10'd100 && DrawY >= 10'd165 && DrawY <= 10'd165+10'd68)
						begin
					    read_address = (DrawX - 10'd70)+(DrawY - 10'd165)*10'd100;
						end
					if(DrawX >= 10'd270 && DrawX <= 10'd270+10'd100 && DrawY >= 10'd165 && DrawY <= 10'd165+10'd68)
						begin
					    read_address = (DrawX - 10'd270)+(DrawY - 10'd165)*10'd100;
						end
					if(DrawX >= 10'd470 && DrawX <= 10'd470+10'd100 && DrawY >= 10'd165 && DrawY <= 10'd165+10'd68)
						begin
					    read_address = (DrawX - 10'd470)+(DrawY - 10'd165)*10'd100;
						end
					if(DrawX >= 10'd70 && DrawX <= 10'd70+10'd100 && DrawY >= 10'd355 && DrawY <= 10'd355+10'd68)
						begin
					    read_address = (DrawX - 10'd70)+(DrawY - 10'd355)*10'd100;
						end
					if(DrawX >= 10'd270 && DrawX <= 10'd270+10'd100 && DrawY >= 10'd355 && DrawY <= 10'd355+10'd68)
						begin
					    read_address = (DrawX - 10'd270)+(DrawY - 10'd355)*10'd100;
						end
					if(DrawX >= 10'd470 && DrawX <= 10'd470+10'd100 && DrawY >= 10'd355 && DrawY <= 10'd355+10'd68)
						begin
					    read_address = (DrawX - 10'd470)+(DrawY - 10'd355)*10'd100;
						end
					out = out_tmp;
				  end
			end
		end
endmodule
