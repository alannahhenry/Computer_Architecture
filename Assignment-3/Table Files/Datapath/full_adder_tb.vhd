library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture Behavioral of full_adder_tb is
	
	component full_adder
		Port(
			A: in std_logic;
			B: in std_logic;
			C_in: in std_logic;
			S: out std_logic;
			C_out: out std_logic
		);
	end component;
	
	signal A: std_logic	:= '0';
	signal B: std_logic	:= '0';
	signal C_in: std_logic	:= '0';
	
	signal S: std_logic;
	signal C_out: std_logic;
	
begin
	
	uut: full_adder
		Port Map(
			A => A,
            B => B,
            C_in => C_in,
            S => S,
            C_out => C_out
		);
		
	sim: process
	
		begin
			
			wait for 1ns;
			A <= '0';
			B <= '0';
			C_in <= '1';
			
			wait for 1ns;
			A <= '0';
			B <= '1';
			C_in <= '0';
			
			wait for 1ns;
			A <= '0';
			B <= '1';
			C_in <= '1';
			
			wait for 1ns;
			A <= '1';
			B <= '0';
			C_in <= '0';
			
			wait for 1ns;
			A <= '1';
			B <= '0';
			C_in <= '1';
			
			wait for 1ns;
			A <= '1';
			B <= '1';
			C_in <= '0';
			
			wait for 1ns;
			A <= '1';
			B <= '1';
			C_in <= '1';
			
			wait;
			
	end process;
		
end Behavioral;library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture Behavioral of full_adder_tb is
	
	component full_adder
		Port(
			A: in std_logic;
			B: in std_logic;
			C_in: in std_logic;
			S: out std_logic;
			C_out: out std_logic
		);
	end component;
	
	signal A: std_logic	:= '0';
	signal B: std_logic	:= '0';
	signal C_in: std_logic	:= '0';
	
	signal S: std_logic;
	signal C_out: std_logic;
	
begin
	
	uut: full_adder
		Port Map(
			A => A,
            B => B,
            C_in => C_in,
            S => S,
            C_out => C_out
		);
		
	sim: process
	
		begin
			
			wait for 1ns;
			A <= '0';
			B <= '0';
			C_in <= '1';
			
			wait for 1ns;
			A <= '0';
			B <= '1';
			C_in <= '0';
			
			wait for 1ns;
			A <= '0';
			B <= '1';
			C_in <= '1';
			
			wait for 1ns;
			A <= '1';
			B <= '0';
			C_in <= '0';
			
			wait for 1ns;
			A <= '1';
			B <= '0';
			C_in <= '1';
			
			wait for 1ns;
			A <= '1';
			B <= '1';
			C_in <= '0';
			
			wait for 1ns;
			A <= '1';
			B <= '1';
			C_in <= '1';
			
			wait;
			
	end process;
		
end Behavioral;