module razhas_pwm(io_in,io_out);

  input[4:0] io_in;
  output reg io_out;
  integer counter_on=0;
  integer counter_off=0;
  integer clk_counter=0;
    

  always @(io_in[4])
  begin : p1
   
    case (io_in[4:1])
      4'b0000:
	   begin
	     assign counter_on=0;
	     assign counter_off=10;
	   end
       4'b0001:
	   begin
	     assign counter_on=1;
	     assign counter_off=9;
	   end
       4'b0010:
	   begin
	     assign counter_on=2;
	     assign counter_off=8;
	   end
       4'b0011:
	   begin
	     assign counter_on=3;
	     assign counter_off=7;
	   end
       4'b0100:
	   begin
	     assign counter_on=4;
	     assign counter_off=6;
	   end
       4'b0101:
	   begin
	     assign counter_on=5;
	     assign counter_off=5;
	   end
       4'b0110:
	   begin
	     assign counter_on=6;
	     assign counter_off=4;
	   end
       4'b0111:
	   begin
	     assign counter_on=7;
	     assign counter_off=3;
	   end
       4'b1000:
	   begin
	     assign counter_on=8;
	     assign counter_off=2;
	   end
       4'b1001:
	   begin
	     assign counter_on=9;
	     assign counter_off=1;
	   end
      default:
	   begin
	     assign counter_on=10;
	     assign counter_off=0;
	   end
    endcase
    if (clk_counter==10)
    begin
      assign clk_counter=0;
    end
    if (counter_on>clk_counter)
    begin
      io_out<=1'b1;
      assign clk_counter = clk_counter +1;
    end
    else if (counter_on <= clk_counter)
    begin
      io_out <= 1'b0;
      assign clk_counter = clk_counter +1;
    end
  end
endmodule