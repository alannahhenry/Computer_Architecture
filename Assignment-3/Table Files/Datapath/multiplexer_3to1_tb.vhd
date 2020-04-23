library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexer_3to1_tb is
end multiplexer_3to1_tb;

architecture Behavioral of multiplexer_3to1_tb is

	constant delay : time := 1ns;
	
	component multiplexer_3to1 
		Port(
			i0: std_logic;
			i1: std_logic;
			i2: std_logic;
			s: in std_logic_vector(1 downto 0);
			z: out std_logic
		);
	end component;
	signal i0: std_logic := '1';
	signal i1: std_logic := '0';
	signal i2: std_logic := '1';
	signal s: std_logic_vector(1 downto 0):= "UU";
	signal z: std_logic;
	
begin

	uut : multiplexer_3to1
		Port Map(
			i0 => i0,
			i1 => i1,
			i2 => i2,
			s => s,
			z => z
		);
		
	sim: process
		begin
		
			wait for delay;
			s <= "00";
			
			wait for delay;
			s <= "01";
			
			wait for delay;
			i0 <= '0';
			s <= "10";
			
			wait;
			
		end process;
		
end Behavioral;
	
	
