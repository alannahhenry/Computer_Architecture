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
			fs: in std_logic_vector(4 downto 0);
			f: out std_logic_vector(15 downto 0);
			v, c, n, z: out std_logic
		);
	end component;
	
	signal a, b: std_logic_vector(15 downto 0);
	signal fs: std_logic_vector(4 downto 0);
	signal f:  std_logic_vector(15 downto 0);
	signal v, c, n, z: std_logic;
	
begin

	uut: functional_unit
		Port Map(
			a => a,
			b => b,
			fs => fs,
			f => f, 
			v => v,
			c => c, 
			n => n, 
			z => z
		);
		
	sim: process
	begin	
		
		fs <= "00000";
		a <= x"00aa";
		b <= x"00bb";
		wait for 1ns;
		
		fs <= "00001";
		a <= x"00aa";
		b <= x"00bb";
		wait for 1ns;
		
		fs <= "00010";
		a <= x"0002";
		b <= x"0001";
		wait for 1ns;
		
		fs <= "00011";
		a <= x"7ffe";
		b <= x"0001";
		wait for 1ns;
		
		fs <= "00100";
		a <= x"0001";
		b <= x"fffc";
		wait for 1ns;
		
		fs <= "00101";
		a <= x"000f";
		b <= x"fffe";
		wait for 1ns;
		
		fs <= "00110";
		a <= x"000a";
		b <= x"000b";
		wait for 1ns;
		
		fs <= "00111";
		a <= x"000a";
		b <= x"000b";
		wait for 1ns;
		
		--logic
		fs <= "01000";
		a <= x"f0cf";
		b <= x"abcd";
		wait for 1ns;
		
		fs <= "01010";
		a <= x"ff00";
		b <= x"a0ee";
		wait for 1ns;
		
		fs <= "01100";
		a <= x"ffff";
		b <= x"abcd";
		wait for 1ns;
		
		fs <= "01110";
		a <= x"aa11";
		b <= x"ffff";
		wait for 1ns;
		
		--shifter
		fs <= "10000";
		a <= x"000a";
		b <= x"000b";
		wait for 1ns;
		
		fs <= "10100";
		a <= x"000a";
		b <= x"000b";
		wait for 1ns;
		
		fs <= "11000";
		a <= x"000a";
		b <= x"000b";
		wait for 1ns;
		
		wait;
	end process;
	
end Behavioral;