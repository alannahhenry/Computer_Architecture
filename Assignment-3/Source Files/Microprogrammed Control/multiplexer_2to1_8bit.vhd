library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexer_2to1_8bit is 
	Port(
		I0 : in std_logic_vector(7 downto 0);
		I1 : in std_logic_vector(7 downto 0);
		S : in std_logic;
		Z : out std_logic_vector(7 downto 0)
	);
end multiplexer_2to1_8bit;

architecture Behavioral of multiplexer_2to1_8bit is

	begin
		Z <= I0 after 1ns when S='0' else
			I1 after 1ns when S= '1' else
			"00000000" after 1ns;
			
end Behavioral;