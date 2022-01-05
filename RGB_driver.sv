module RGB_driver (input  [7:0]  color_index,
                  output logic [23:0]  rgb_out);
always_comb
	begin
    unique case (color_index)
		  8'h00: rgb_out=24'hbba27a;
        8'h01: rgb_out=24'h3e4343;
        8'h02: rgb_out=24'h000000;
        8'h03: rgb_out=24'hffffff;
        8'h04: rgb_out=24'hed1c24;
        8'h05: rgb_out=24'ha98c6e;
        8'h06: rgb_out=24'hfff200;
        8'h07: rgb_out=24'heea08c;
        8'h08: rgb_out=24'hfff0e9;
        8'h09: rgb_out=24'hff80a9;
        8'h0a: rgb_out=24'h208be3;
        8'h0b: rgb_out=24'h008040;
        8'h0c: rgb_out=24'h00572c;
        8'h0d: rgb_out=24'hff7f27;
        8'h0e: rgb_out=24'hff286f;
        8'h0f: rgb_out=24'h880015;
        8'h10: rgb_out=24'h5c3d2c;
		  8'h11: rgb_out=24'h9b8232;
		  8'h12: rgb_out=24'h92f984;
		  8'h13: rgb_out=24'h41debf;
		  8'h14: rgb_out=24'he84783;
		  8'h15: rgb_out=24'hf8f25c;
		  8'h16: rgb_out=24'hf4f8b3;
		  8'h17: rgb_out=24'hb6a34b;
		  8'h18: rgb_out=24'h3e3d21;
		  8'h19: rgb_out=24'h6f624f;
		  8'h1a: rgb_out=24'hf9616d;  
		  8'h1b: rgb_out=24'h2f4e13;  
		  8'h1c: rgb_out=24'h2f2f2a;
		  //marked as the Transparent pixels
        default : rgb_out = 24'h000000; //by default, black
    endcase
    end
endmodule




