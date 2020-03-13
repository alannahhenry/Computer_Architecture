library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexer_8to1 is
	Port(
	      i0: in std_logic_vector(15 downto 0);
	      i1: in std_logic_vector(15 downto 0);
	      i2: in std_logic_vector(15 downto 0);
	      i3: in std_logic_vector(15 downto 0);
	      i4: in std_logic_vector(15 downto 0);
	      i5: in std_logic_vector(15 downto 0);
	      i6: in std_logic_vector(15 downto 0);
	      i7: in std_logic_vector(15 downto 0);
	      
	      s0: in std_logic;
	      s1: in std_logic;
	      s2: in std_logic;
	      
	      Z: out std_logic_vector(15 downto 0)
	);
end multiplexer_8to1;


architecture Behavioral of multiplexer_8to1 is
begin
	
	Z<= i0 after 5 ns when s0='0' and s1='0' and s2='0' else
	    i1 after 5 ns when s0='0' and s1='0' and s2='1' else
	    i2 after 5 ns when s0='0' and s1='1' and s2='0' else
	    i3 after 5 ns when s0='0' and s1='1' and s2='1' else
	    i4 after 5 ns when s0='1' and s1='0' and s2='0' else
	    i5 after 5 ns when s0='1' and s1='0' and s2='1' else
	    i6 after 5 ns when s0='1' and s1='1' and s2='0' else
	    i7 after 5 ns when s0='1' and s1='1' and s2='1' else
		
	    "0000000000000000" after 5 ns;

end Behavioral;	
