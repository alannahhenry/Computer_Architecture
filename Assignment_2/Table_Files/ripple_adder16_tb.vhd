library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ripple_adder16_tb is
end ripple_adder16_tb;

architecture Behavioral of ripple_adder16_tb is

	component ripple_adder16
		Port(
			A: in std_logic_vector(15 downto 0);
			B: in std_logic_vector(15 downto 0);
			C_in: in std_logic;
			S: out std_logic_vector(15 downto 0);
			C_out: out std_logic;
			V: out std_logic
		);
	end component;
	
	signal A: std_logic_vector(15 downto 0);
	signal B: std_logic_vector(15 downto 0);
	signal C_in: std_logic;
	signal S: std_logic_vector(15 downto 0);
	signal C_out: std_logic;
	signal V: std_logic;
	
begin

	uut: ripple_adder16
		Port Map(
			A => A,
			B => B, 
			C_in => C_in,
			S => S,
			C_out => C_out,
			V => V
		);
		
	sim: process
	
	begin
	
		wait for 1ns;
		A <= x"AAAA";
        B <= x"0000";
        C_in <= '0';
		
		wait for 1ns;
		A <= x"AAA0";
        B <= x"0000";
        C_in <= '1';
		
		wait for 1ns;
		A <= x"1100";
        B <= x"0001";
        C_in <= '0';
		
		wait for 1ns;
		A <= x"1100";
        B <= x"0001";
        C_in <= '1';
		
		
		wait for 1ns;
		A <= x"FFFE";
        B <= x"0001";
        C_in <= '1';
		
	end process;
	
end;
		
		