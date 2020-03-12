library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg16_tb is
end reg16_tb;

architecture Behavioral of reg16_tb is
	component reg16 is
		Port(
			D: in std_logic_vector(15 downto 0);
	     		load, Clk: std_logic;
	    		Q: out std_logic_vector(15 downto 0)
		);
	end component;

	signal D : std_logic_vector(15 downto 0):= x"0000";
	signal load : std_logic := '0';
	signal Clk : std_logic := '0';
	
	signal Q : std_logic_vector(15 downto 0):= x"0000";

	constant clk_period : time := 10ns;

begin
	UUT: reg16
	PORT MAP(
		D => D,
		load => load,
		Clk => Clk,
		Q => Q	
	);

clk_process :process
begin 
	Clk <= '0';
	wait for clk_period/2;
	Clk <= '1';
	wait for clk_period/2;
end process;

simulation_process :process
begin
	D <= x"000A";
	load <= '0';
	wait for 5ns;
	
	load <= '1';
	wait for 5ns;
	
	D <= x"00FF";
	load <= '0';
	wait for 5ns;
	
	load <= '1';
	wait for 5ns;
end process;
end Behavioral;