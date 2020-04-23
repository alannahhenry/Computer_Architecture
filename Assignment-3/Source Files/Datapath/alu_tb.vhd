library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu_tb is
end alu_tb;

architecture Behavioral of alu_tb is

	component alu is
		Port(
			a: in std_logic_vector(15 downto 0);
			b: in std_logic_vector(15 downto 0);
			c_in: in std_logic;
			g_sel: in std_logic_vector(2 downto 0);
			c_out: out std_logic;
			v: out std_logic;
			g: out std_logic_vector(15 downto 0)
		);
	end component;
	
	signal a: std_logic_vector(15 downto 0);
	signal b: std_logic_vector(15 downto 0);
	signal c_in: std_logic;
	signal g_sel: std_logic_vector(2 downto 0);
	signal c_out: std_logic;
	signal v: std_logic;
	signal g: std_logic_vector(15 downto 0);
	
begin

	uut: alu
		Port Map(
			a => a,
			b => b,
			c_in => c_in,
			g_sel => g_sel,
			c_out => c_out,
			v => v, 
			g => g
		);
		
	sim: process
	begin	
		
			wait for 1ns;
			a <= x"ffaa";
			b <= x"000f";
			g_sel <= "000";
			c_in <= '0';
			
			wait for 1ns;
			g_sel <= "000";
			c_in <= '1';
			
			wait for 1ns;
			g_sel <= "001";
			c_in <= '0';
			
			wait for 1ns;
			g_sel <= "001";
			c_in <= '1';
			
			wait for 1ns;
			g_sel <= "010";
			c_in <= '0';
			
			wait for 1ns;
			g_sel <= "010";
			c_in <= '1';
			
			wait for 1ns;
			g_sel <= "011";
			c_in <= '0';
			
			wait for 1ns;
			g_sel <= "011";
			c_in <= '1';
			
			wait for 1ns;
			g_sel <= "100";
			c_in <= '0';
			
			wait for 1ns;
			g_sel <= "101";
			
			wait for 1ns;
			g_sel <= "110";
			
			wait for 1ns;
			g_sel <= "111";
			
			wait;
			
	end process;

end Behavioral;
		
			