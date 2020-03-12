library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexer_2to1 is
	Port(
	      i0: in std_logic_vector(15 downto 0);
	      i1: in std_logic_vector(15 downto 0);
	      s: in std_logic;
	      Z: out std_logic_vector(15 downto 0);
	);
end multiplexer_2to1;


architecture Behavioral of multiplexer_2to1 is
begin
	
	Z<= i0 after 5 ns when s='0' else
	    i1 after 5 ns when s='1' else
	    "0000000000000000" after 5 ns;

end Behavioral;	