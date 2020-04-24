library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexer_3to1 is
	Port(
		i0: std_logic;
		i1: std_logic;
		i2: std_logic;
		s: in std_logic_vector(1 downto 0);
		z: out std_logic
	);
end multiplexer_3to1;

architecture Behavioral of multiplexer_3to1 is 

begin
	with s select
		Z <= i0 after 1ns when "00", 
			i1 after 1ns when "01", 
			i2 after 1ns when "10",
			'U' after 1ns when others;
			
end Behavioral;