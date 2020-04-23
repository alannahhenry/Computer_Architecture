library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity functional_unit_tb is
end functional_unit_tb;

architecture Behavioral of functional_unit_tb is

	component functional_unit is 
		Port(
			a, b: in std_logic_vector(15 downto 0);
			f_select: in std_logic_vector(4 downto 0);
			f: out std_logic_vector(15 downto 0);
			v, c, n, z: out std_logic
		);
	end component;
	
	signal a, b: std_logic_vector(15 downto 0);
	signal f_select: std_logic_vector(4 downto 0);
	signal f:  std_logic_vector(15 downto 0);
	signal v, c, n, z: std_logic;
	
begin

	uut: functional_unit
		Port Map(
			a => a,
			b => b,
			f_select => f_select,
			f => f, 
			v => v,
			c => c, 
			n => n, 
			z => z
		);
		
	sim: process
	begin	
		
		f_select <= "00000";
		a <= x"00aa";
		b <= x"00bb";
		wait for 1ns;
		
		f_select <= "00001";
		a <= x"00aa";
		b <= x"00bb";
		wait for 1ns;
		
		f_select <= "00010";
		a <= x"0002";
		b <= x"0001";
		wait for 1ns;
		
		f_select <= "00011";
		a <= x"7ffe";
		b <= x"0001";
		wait for 1ns;
		
		f_select <= "00100";
		a <= x"0001";
		b <= x"fffc";
		wait for 1ns;
		
		f_select <= "00101";
		a <= x"000f";
		b <= x"fffe";
		wait for 1ns;
		
		f_select <= "00110";
		a <= x"000a";
		b <= x"000b";
		wait for 1ns;
		
		f_select <= "00111";
		a <= x"000a";
		b <= x"000b";
		wait for 1ns;
		
		--logic
		f_select <= "01000";
		a <= x"f0cf";
		b <= x"abcd";
		wait for 1ns;
		
		f_select <= "01010";
		a <= x"ff00";
		b <= x"a0ee";
		wait for 1ns;
		
		f_select <= "01100";
		a <= x"ffff";
		b <= x"abcd";
		wait for 1ns;
		
		f_select <= "01110";
		a <= x"aa11";
		b <= x"ffff";
		wait for 1ns;
		
		--shifter
		f_select <= "10000";
		a <= x"000a";
		b <= x"000b";
		wait for 1ns;
		
		f_select <= "10100";
		a <= x"000a";
		b <= x"000b";
		wait for 1ns;
		
		f_select <= "11000";
		a <= x"000a";
		b <= x"000b";
		wait for 1ns;
		
		wait;
	end process;
	
end Behavioral;