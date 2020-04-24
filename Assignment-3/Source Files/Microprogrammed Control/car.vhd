library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity car is 
	Port(
		car_in: in std_logic_vector(7 downto 0);
		s: in std_logic;
		reset: in std_logic;
		Clk : in std_logic;
		car_out: out std_logic_vector(7 downto 0)
	);
end car;

architecture Behavioral of car is 
	begin
		
		process(reset, Clk)
			variable current : std_logic_vector(7 downto 0);

			begin
				if(reset = '1') then current := x"c0";
				elsif(s = '1' and Clk ='1') then current := car_in;
				end if;
				
				car_out <= current;
				
		end process;
		
end Behavioral;
				