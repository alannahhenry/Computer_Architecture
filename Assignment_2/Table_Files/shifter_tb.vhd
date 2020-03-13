library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shifter_tb is
end shifter_tb;

architecture Behavioral	of shifter_tb is	
	
	component shifter
		Port(
			B: in std_logic_vector(15 downto 0);
			S: in std_logic_vector(1 downto 0);
			IL: in std_logic;
			IR: in std_logic;
			H: out std_logic_vector(15 downto 0)
		);
	end component;
	
	signal B: std_logic_vector(15 downto 0):= x"FFFF";
	signal S: std_logic_vector(1 downto 0) := "UU";
	signal IL: std_logic := '0';
	signal IR: std_logic := '0';
	signal H: std_logic_vector(15 downto 0);
	
begin
	
	uut: shifter
		Port Map(
			B => B,
			S => S,
			IL => IL,
			IR => IR
			H => H
		);
		
	sim: process
		
		begin
		
			wait for 1ns;
			S <= "00";
			
			wait for 1ns;
			S <= "01";
			
			wait for 1ns;
			S <= "10";
			
			wait;
		
		end process;
		
end Behavioral;
		
	