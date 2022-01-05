//-------------------------------------------------------------------------
//      lab8.sv                                                          --
//      Christine Chen                                                   --
//      Fall 2014                                                        --
//                                                                       --
//      Modified by Po-Han Huang                                         --
//      10/06/2017                                                       --
//                                                                       --
//      Fall 2017 Distribution                                           --
//                                                                       --
//      For use with ECE 385 Lab 8                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module lab8( input               CLOCK_50,
             input        [3:0]  KEY,          //bit 0 is set up as Reset
             output logic [6:0]  HEX0, HEX1,HEX2,HEX3,HEX4,HEX5,
             // VGA Interface 
             output logic [7:0]  VGA_R,        //VGA Red
                                 VGA_G,        //VGA Green
                                 VGA_B,        //VGA Blue
             output logic        VGA_CLK,      //VGA Clock
                                 VGA_SYNC_N,   //VGA Sync signal
                                 VGA_BLANK_N,  //VGA Blank signal
                                 VGA_VS,       //VGA virtical sync signal
                                 VGA_HS,       //VGA horizontal sync signal
             // CY7C67200 Interface
             inout  wire  [15:0] OTG_DATA,     //CY7C67200 Data bus 16 Bits
             output logic [1:0]  OTG_ADDR,     //CY7C67200 Address 2 Bits
             output logic        OTG_CS_N,     //CY7C67200 Chip Select
                                 OTG_RD_N,     //CY7C67200 Write
                                 OTG_WR_N,     //CY7C67200 Read
                                 OTG_RST_N,    //CY7C67200 Reset
             input               OTG_INT,      //CY7C67200 Interrupt
             // SDRAM Interface for Nios II Software
             output logic [12:0] DRAM_ADDR,    //SDRAM Address 13 Bits
             inout  wire  [31:0] DRAM_DQ,      //SDRAM Data 32 Bits
             output logic [1:0]  DRAM_BA,      //SDRAM Bank Address 2 Bits
             output logic [3:0]  DRAM_DQM,     //SDRAM Data Mast 4 Bits
             output logic        DRAM_RAS_N,   //SDRAM Row Address Strobe
                                 DRAM_CAS_N,   //SDRAM Column Address Strobe
                                 DRAM_CKE,     //SDRAM Clock Enable
                                 DRAM_WE_N,    //SDRAM Write Enable
                                 DRAM_CS_N,    //SDRAM Chip Select
                                 DRAM_CLK,      //SDRAM Clock
				output logic         CE, UB, LB, OE, WE,
	         output logic  [19:0] ADDR,
	         inout  wire   [15:0] Data
                    );
    
    logic Reset_h, Clk;
  //  logic [7:0] keycode;
	 logic [9:0] Draw_X, Draw_Y;
    logic ismole,issoil,ischuizi;
	 logic [23:0] Color, Color2;
    assign Clk = CLOCK_50;
    always_ff @ (posedge Clk) begin
        Reset_h <= ~(KEY[0]);        // The push buttons are active low
    end
    
    logic [1:0] hpi_addr;
    logic [15:0] hpi_data_in, hpi_data_out;
    logic hpi_r, hpi_w, hpi_cs, hpi_reset;
	 logic [3:0] rand1,rand2;
   
	 logic [15:0] mouse_x,mouse_y;
	 logic[7:0] mouse_click;
	 logic [9:0] MouseX,MouseY;
	 assign MouseX=mouse_x[9:0];
	 assign MouseY=mouse_y[9:0];
	 
	 //for debug
	 logic up1,up2,start_export;
	 
     // You need to make sure that the port names here match the ports in Qsys-generated codes.
	lab8_soc u0 (
		.clk_clk                (Clk),                //             clk.clk
		.cy7c67200_DATA     (OTG_DATA),     //   cy7c67200.DATA
		.cy7c67200_ADDR     (OTG_ADDR),     //            .ADDR
		.cy7c67200_RD_N     (OTG_RD_N),     //            .RD_N
		.cy7c67200_WR_N     (OTG_WR_N),     //            .WR_N
		.cy7c67200_CS_N     (OTG_CS_N),     //            .CS_N
		.cy7c67200_RST_N    (OTG_RST_N),    //            .RST_N
		.cy7c67200_INT      (OTG_INT),      //            .INT
		.mouse_click_export (mouse_click), // mouse_click.export
		.mouse_x_export     (mouse_x),     //     mouse_x.export
		.mouse_y_export     (mouse_y),     //     mouse_y.export

		.reset_reset_n          (1'b1),          //           reset.reset_n
		.sdram_clk_clk          (DRAM_CLK),          //       sdram_clk.clk
		.sdram_wire_addr        (DRAM_ADDR),        //      sdram_wire.addr
		.sdram_wire_ba          (DRAM_BA),          //                .ba
		.sdram_wire_cas_n       (DRAM_CAS_N),       //                .cas_n
		.sdram_wire_cke         (DRAM_CKE),         //                .cke
		.sdram_wire_cs_n        (DRAM_CS_N),        //                .cs_n
		.sdram_wire_dq          (DRAM_DQ),          //                .dq
		.sdram_wire_dqm         (DRAM_DQM),         //                .dqm
		.sdram_wire_ras_n       (DRAM_RAS_N),       //                .ras_n
		.sdram_wire_we_n        (DRAM_WE_N),        //                .we_n
		.random1_export(rand1),
		.random2_export(rand2)
	);
    
    // Use PLL to generate the 25MHZ VGA_CLK.
    // You will have to generate it on your own in simulation.
    vga_clk vga_clk_instance(.inclk0(Clk), .c0(VGA_CLK));
    logic [15:0] random_number;
    // TODO: Fill in the connections for the rest of the modules 
    VGA_controller vga_controller_instance(.Clk(Clk),
														 .Reset(Reset_h),
														 .VGA_HS(VGA_HS),
														 .VGA_VS(VGA_VS),
														 .VGA_CLK(VGA_CLK),
														 .VGA_BLANK_N(VGA_BLANK_N),
														 .VGA_SYNC_N(VGA_SYNC_N), 
														 .DrawX(Draw_X),
														 .DrawY(Draw_Y));													 
                                          
    // Which signal should be frame_clk?
	 logic[23:0] out_export;
	 logic[7:0] score_out;
	 whack_a_mole whack_a_mole_inst(.Clk(Clk),
	                                .frame_clk(VGA_VS),
											  .RESET(Reset_h),
											  .mouseX(mouse_x),
											  .mouseY(mouse_y),
											  .mouse_click(mouse_click),
											  .rand1(rand1),
											  .DrawX(Draw_X),
											  .DrawY(Draw_Y),
											  .VGA_R(VGA_R),
											  .VGA_G(VGA_G),
											  .VGA_B(VGA_B),
//											  .random_number(random_number),
											  .up1(up1),
											  .up2(up2),
											  .start_export(start_export),
											  .out_export(out_export),
                                   .score_out(score_out),
											  .bg_rgb(bg_rgb),
											  .offset(offset)
											  );
//	logic [3:0] rand1_temp,rand2_temp;
	

//	
//	always_ff @(posedge KEY[1])
//	begin
//		rand1<=rand1_temp;
//		rand2<=rand2_temp;
//	end
	
	
	
//    mole_move mole(.Clk(Clk),.Reset(Reset_h),.frame_clk(VGA_VS),.DrawX(Draw_X),.DrawY(Draw_Y),.out(Color),.out2(Color2),.ismole(ismole),.issoil(issoil));
//
//    color_mapper color_instance(.color(Color),.color2(Color2),.ismole(ismole),.issoil(issoil),.DrawX(Draw_X),.DrawY(Draw_Y),.VGA_R(VGA_R), .VGA_G(VGA_G), .VGA_B(VGA_B));
    
    // Display keycode on hex display
//    HexDriver hex_inst_0 ({1'b0,up1,up2,start_export}, HEX0);
//    HexDriver hex_inst_1 (random_number[7:4], HEX1);

logic [19:0] bg_addr;
logic [19:0]  offset;
logic [23:0] bg_rgb;
logic [15:0] Data_from_CPU, Data_from_SRAM, Data_to_CPU, Data_to_SRAM;
logic [7:0]  color_index;
assign bg_addr=Draw_X+ Draw_Y*10'd640+offset;

  //SRAM
    assign WE = 1'b1;
	 assign CE = 1'b0;
	 assign UB = 1'b0;
	 assign LB = 1'b0;
    assign OE = ~WE;
    assign ADDR = bg_addr;
    assign color_index=Data_to_CPU[7:0];


	 // Our SRAM and I/O controller
	 Mem2IO memory_subsystem(
		 .*, .Reset(Reset_h), .ADDR(ADDR),
		 .Data_from_CPU(), .Data_to_CPU(Data_to_CPU),
		 .Data_from_SRAM(Data_from_SRAM), .Data_to_SRAM(Data_to_SRAM)
	 );


    // The tri-state buffer serves as the interface between Mem2IO and SRAM
	 tristate #(.N(16)) tr0(
		 .Clk(Clk), .tristate_output_enable(~WE), .Data_write(Data_to_SRAM), .Data_read(Data_from_SRAM), .Data(Data));
    RGB_driver rgb1(.color_index(color_index),.rgb_out(bg_rgb)); 
	 

//	 //show the data from sram
//	 logic[15:0] show;
//	 logic[15:0] show_in;
//	 always_ff @ (posedge Clk)
//	 begin
//			if(Reset_h)
//				show<=16'dx;
//			else
//				show<=show_in;
//	 end




	 HexDriver hex_inst_0 (score_out[3:0], HEX0);
	 HexDriver hex_inst_1 (score_out[7:4], HEX1);
	 HexDriver hex_inst_2 (rand1, HEX2);
	 HexDriver hex_inst_3 (rand2, HEX3);
	 
	 
    
    /**************************************************************************************
        ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
        Hidden Question #1/2:
        What are the advantages and/or disadvantages of using a USB interface over PS/2 interface to
             connect to the keyboard? List any two.  Give an answer in your Post-Lab.
    **************************************************************************************/
endmodule

