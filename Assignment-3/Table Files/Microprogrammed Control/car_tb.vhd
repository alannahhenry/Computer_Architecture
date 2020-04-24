library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity car_tb is
end car;

architecture Behavioral of car_tb is
		
	component car is 
		Port(
			car_in: in std_logic_vector(7 downto 0);
			s: in std_logic;
			reset: in std_logic;
			car_out: out std_logic_vector(7 downto 0)
		);
		
	end component;
	
	signal car_in : std_logic_vector(7 downto 0):=(others => '0');
	signal s: std_logic;
	signal reset : std_logic;
	signal car_out : std_logic_vector(7 downto 0):=(others => '0');
	
begin
	
	uut: car
		Port Map(
			car_in => car_in,
			s => s,
			reset => reset,
			car_out => car_out
		);
		
	sim : process
	begin 
		
		reset = '1';
		wait for 10ns;
		
		reset <= '0';
		car_in <= x"02";
		s <= '0';
		wait for 10ns;
		
		car_in <= x"03";
		s <= '1';
		wait for 10ns;
		
		CLK <= '0';
		wait for 10ns;
		
		reset <= '1';
		wait for 10ns;
		
	end process;

end Behavioral;

	