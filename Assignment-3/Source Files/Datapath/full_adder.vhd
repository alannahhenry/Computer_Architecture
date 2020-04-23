library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder is
	Port(
			A: in std_logic;
			B: in std_logic;
			C_in: in std_logic;
			S: out std_logic;
			C_out: out std_logic
		);
end full_adder;

architecture Behavioral of full_adder is

	signal S0, S1, S2: std_logic;
	
	begin
		S <= (A xor B) xor C_in after 1 ns;
		C_out <= ((A xor B) and C_in) or (A and B) after 1ns;
	
	end Behavioral;