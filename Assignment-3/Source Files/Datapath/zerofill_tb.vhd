library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity zerofill_tb is
end zerofill_tb;

architecture Behavioral of zerofill_tb is

	component zerofill
		Port(
			SB : in std_logic_vector(2 downto 0);
			zeroFill : out std_logic_vector(15 downto 0)
		);
	end component;
	
	signal SB: std_logic_vector(2 downto 0) := "000";
	signal zf: std_logic_vector(15 downto 0) :=x"0000";
	
	begin
		uut: zerofill
			Port Map(
				SB => SB,
				zeroFill => zf
			);
			
		sim: process
		begin 
		
			SB <= "111";
			wait for 10ns;
			
			SB <= "010";
			wait for 10ns;
			
			wait;
			
		end process;
		
end Behavioral;
			