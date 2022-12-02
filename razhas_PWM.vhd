library IEEE;
use IEEE.std_logic_1164.all;


entity razhasmod is
port( io_in: in std_logic_vector (4 downto 0);
	  io_out: out std_logic);
end razhasmod;



architecture behavioral of razhasmod is
begin

p1:process(io_in)
variable counter_on: integer:=0;
variable counter_off: integer:=0;
variable clk_counter: integer:=0;
begin
	case io_in(4 downto 1) is
	when "0000"=>counter_on:=0;
    			 	counter_off:=10;
    	when "0001"=>counter_on:=1;
    		   	 	counter_off:=9;
    	when "0010"=>counter_on:=2;
    		     	counter_off:=8;
    	when "0011"=>counter_on:=3;
    		     	counter_off:=7;
    	when "0100"=>counter_on:=4;
  	 		     	counter_off:=6;
    	when "0101"=>counter_on:=5;
    		     	counter_off:=5;
    	when "0110"=>counter_on:=6;
    		     	counter_off:=4;
    	when "0111"=>counter_on:=7;
    		     	counter_off:=3;
    	when "1000"=>counter_on:=8;
    		     	counter_off:=2;
    	when "1001"=>counter_on:=9;
    			     counter_off:=1;
    	when others=>counter_on:=10;
    		     	counter_off:=0;
	end case;             

if (rising_edge(io_in(0))) then
	if (clk_counter=10) then
            clk_counter:=0;
      end if;      
    if (counter_on>clk_counter) then
    		io_out<='1';
			clk_counter:= clk_counter+1;
    elsif (counter_on<=clk_counter) then
    		io_out<='0';
            clk_counter:=clk_counter+1;
	  end if;
end if;
end process;
end behavioral;