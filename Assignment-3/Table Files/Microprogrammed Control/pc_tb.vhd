library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pc_tb is
end pc_tb;

architecture Behavioral of pc_tb is
	component pc is
		Port(
			PC_in: in std_logic_vector(15 downto 0);
			PL: in std_logic;
			PI: in std_logic;
			Clk: in std_logic;
			Reset: in std_logic;
			PC_out: out std_logic_vector(15 downto 0)
		);	
	end component;
	
	signal PC_in : std_logic_vector(15 downto 0) := x"0000";
	signal PL : std_logic := '0';
	signal PI : std_logic := '0';
	signal Clk : std_logic := '0';
	signal Reset : std_logic := '0';
	signal PC_out : std_logic_vector(15 downto 0) := x"0000";
	
begin
	uut: pc
		Port Map(
			PC_in => PC_in,
			PL => PL,
			PI => PI,
			Clk => Clk,
			Reset => Reset,
			PC_out => PC_out
		);
		
	sim: process
	begin
		Reset <='1';
		Clk <='1';
		wait for 10ns;
		
		Reset <='0';
		Clk <= '0';
		wait for 10ns;
		
		PC_in <=x"ABCD";
		PL <='1';
		PI <= '0'
		Clk <= '1';
		wait for 10ns;
		
		Clk <='0';
		wait for 10ns;
		
		Reset <='1';
		Clk <='1';
		wait for 10ns;
		
	end process;
	
end Behavioral;