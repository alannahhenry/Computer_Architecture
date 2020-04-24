library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexer_2to1_8bit_tb is
end multiplexer_2to1_8bit_tb;

architecture Behavioral of multiplexer_2to1_8bit_tb is

	component multiplexer_2to1_8bit is
		Port(
			I0 : in std_logic_vector(7 downto 0);
			I1 : in std_logic_vector(7 downto 0);
			S : in std_logic;
			Z : out std_logic_vector(7 downto 0)
		);
	end component;
	
	signal I0 : std_logic_vector(7 downto 0):= "00000000";
	signal I1 : std_logic_vector(7 downto 0):= "00000000";
	signal S : std_logic := '0';
	signal Z : std_logic_vector(7 downto 0):= "00000000";
	
	begin
		uut: multiplexer_2to1_8bit
			Port Map(
				I0 => I0,
				I1 => I1,
				S => S,
				Z => Z
			);
			
	sim: process
		begin
			I0 <= "10101010";
			I1 <= "11111111";
			
			S <= '0';
			wait for 5ns;
			
			S <= '1';
			wait for 5ns;
			
	end process;
	
end Behavioral;
			