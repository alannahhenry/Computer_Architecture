library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logic_unit_tb is
end logic_unit_tb;

architecture Behavioral of logic_unit_tb is

	component logic_unit is
		Port(
			a: in std_logic_vector(15 downto 0);
			b: in std_logic_vector(15 downto 0);
			s: in std_logic_vector(1 downto 0);
			z: out std_logic_vector(15 downto 0)
		);
	end component;
	
	signal a: std_logic_vector(15 downto 0);
	signal b: std_logic_vector(15 downto 0);
	signal s: std_logic_vector(1 downto 0);
	signal z: std_logic_vector(15 downto 0);
	
begin
	
	uut: logic_unit
		Port Map(
			a => a,
			b => b, 
			s => s,
			z => z
		);
		
	sim: process
		begin
		
			a <= x"f0cf";
			b <= x"abcd";
			s <= "00";
			wait for 1ns;
			
			a <= x"ff00";
			b <= x"abcd";
			s <= "01";
			wait for 1ns;
			
			a <= x"ffff";
			b <= x"abcd";
			s <= "10";
			wait for 1ns;
			
			a <= x"AA11";
			b <= x"ffff";
			s <= "11";
			wait for 1ns;
			
			wait;
			
		end process;
		
end Behavioral;
			
	