library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexer_9to1tb is
end multiplexer_9to1tb;

architecture Behavioral of multiplexer_9to1tb is

	component multiplexer_9to1
		Port(
			src: in std_logic_vector(3 downto 0);
			I0: in std_logic_vector(15 downto 0);
			I1: in std_logic_vector(15 downto 0);
			I2: in std_logic_vector(15 downto 0);
			I3: in std_logic_vector(15 downto 0);
			I4: in std_logic_vector(15 downto 0);
			I5: in std_logic_vector(15 downto 0);
			I6: in std_logic_vector(15 downto 0);
			I7: in std_logic_vector(15 downto 0);
			I8: in std_logic_vector(15 downto 0);
			
			Z: out std_logic_vector(15 downto 0);
		);
	end component;
	
	--Signals
	signal src : std_logic_vector(3 downto 0):= "0000";
	signal I0 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal I1 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal I2 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal I3 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal I4 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal I5 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal I6 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal I7 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal I8 : std_logic_vector(15 downto 0):= "0000000000000000";
	
	signal Z : std_logic_vector(15 downto 0):= "0000000000000000";
	
begin

	uut: multiplexer_9to1
		Port Map(
			I0 => I0,
			I1 => I1,
			I2 => I2,
			I3 => I3,
			I4 => I4,
			I5 => I5,
			I6 => I6,
			I7 => I7,
			I8 => I8,
			src => src,
			Z => Z
		);
		
	sim: process
		begin
			I0 <= x"00AA";
			I1 <= x"00BB";
			I2 <= x"00CC";
			I3 <= x"00DD";
			I4 <= x"00DEE";
			I5 <= x"00FF";
			I6 <= x"00AA";
			I7 <= x"00BB";
			I8 <= x"00CC";
			
			src <= "0000";
			wait for 5ns;
			
			src <= "0001";
			wait for 5ns;
			
			src <= "0010";
			wait for 5ns;
			
			src <= "0011";
			wait for 5ns;
			
			src <= "0100";
			wait for 5ns;
			
			src <= "0101";
			wait for 5ns;
			
			src <= "0110";
			wait for 5ns;
			
			src <= "0111";
			wait for 5ns;
			
			src <= "1000";
			wait for 5ns;
			
	end process;
end Behavioral;
			
			
			