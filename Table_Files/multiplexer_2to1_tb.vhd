library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexer_2to1_tb is

end multiplexer_2to1_tb;

architecture Behavioural of multiplexer_2to1_tb is
	
	component multiplexer_2to1 is
		Port(
	     		i0: in std_logic_vector(15 downto 0);
	      		i1: in std_logic_vector(15 downto 0);
	      		s: in std_logic;
	      		Z: out std_logic_vector(15 downto 0);
		);
	end component;

	signal i0 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal i1 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal s : std_logic := "0";

	signal Z : std_logic_vector(15 downto 0):= "0000000000000000";

begin

	UUT: multiplexer_2to1
	PORT MAP(
		i0 => i0,
		i1 => i1,
		s => s,
		Z => Z
	);
simulation_process :process
begin
	i0 <= "1010101010101010";
	i1 <= "1111111111111111";
	
	s <= '0';
	wait for 5ns;
	
	s <= '1';
	wait for 5ns;

	end process;

end Behavioral;