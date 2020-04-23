library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_filetb is
end register_filetb;

architecture Behavioral of register_filetb is
	
	component register_file is	
		Port(
			DA: in std_logic_vector(3 downto 0);
			AA: in std_logic_vector(3 downto 0);
			BA: in std_logic_vector(3 downto 0);
		
			clk: in std_logic;
			RW: in std_logic;
		
			data: in std_logic_vector(15 downto 0);
		
			a_out: out std_logic_vector(15 downto 0);
			b_out: out std_logic_vector(15 downto 0);
		
			reg0: out std_logic_vector(15 downto 0);
			reg1: out std_logic_vector(15 downto 0);
			reg2: out std_logic_vector(15 downto 0);
			reg3: out std_logic_vector(15 downto 0);
			reg4: out std_logic_vector(15 downto 0);
			reg5: out std_logic_vector(15 downto 0);
			reg6: out std_logic_vector(15 downto 0);
			reg7: out std_logic_vector(15 downto 0);
			reg8: out std_logic_vector(15 downto 0)
		);
	end component;
	
	--Signals
	
	signal AA: std_logic_vector(3 downto 0):= "0000";
	signal BA: std_logic_vector(3 downto 0):= "0000";
	signal DA: std_logic_vector(3 downto 0):= "0000";
	
	signal Clk: std_logic := '0';
	signal RW: std_logic := '0';
	
	signal data : std_logic_vector(15 downto 0):= '0';
	
	signal a_out: std_logic_vector(15 downto 0):= x"0000";
	signal b_out: std_logic_vector(15 downto 0):= x"0000";
	
	signal reg0out: std_logic_vector(15 downto 0):= x"0000";
	signal reg1out: std_logic_vector(15 downto 0):= x"0000";
	signal reg2out: std_logic_vector(15 downto 0):= x"0000";
	signal reg3out: std_logic_vector(15 downto 0):= x"0000";
	signal reg4out: std_logic_vector(15 downto 0):= x"0000";
	signal reg5out: std_logic_vector(15 downto 0):= x"0000";
	signal reg6out: std_logic_vector(15 downto 0):= x"0000";
	signal reg7out: std_logic_vector(15 downto 0):= x"0000";
	signal reg8out: std_logic_vector(15 downto 0):= x"0000";
	
begin

	uut: register_file
		Port Map(
			DA => DA,
			AA => AA,
			BA => BA,
			
			clk => Clk,
			RW => RW,
			
			data => data,
			
			a_out => a_out,
			b_out => b_out,
			
			reg0 => reg0out,
			reg1 => reg1out,
			reg2 => reg2out,
			reg3 => reg3out,
			reg4 => reg4out,
			reg5 => reg5out,
			reg6 => reg6out,
			reg7 => reg7out,
			reg8 => reg8out,
		);
		
	sim: process
		begin

			RW <= '1';
			
			data <= x"00fa";
			DA <= "0000";
			wait for 10ns;
			Clk <= '1';
			wait for 10ns;
			Clk <= '0';
			
			data <= x"00fb";
			DA <= "0001";
			wait for 10ns;
			Clk <= '1';
			wait for 10ns;
			Clk <= '0';
			
			data <= x"00fc";
			DA <= "0010";
			wait for 10ns;
			Clk <= '1';
			wait for 10ns;
			Clk <= '0';
			
			data <= x"00fd";
			DA <= "0011";
			wait for 10ns;
			Clk <= '1';
			wait for 10ns;
			Clk <= '0';
			
			data <= x"00fe";
			DA <= "0100";
			wait for 10ns;
			Clk <= '1';
			wait for 10ns;
			Clk <= '0';
			
			data <= x"00ff";
			DA <= "0101";
			wait for 10ns;
			Clk <= '1';
			wait for 10ns;
			Clk <= '0';
			
			data <= x"0faa";
			DA <= "0110";
			wait for 10ns;
			Clk <= '1';
			wait for 10ns;
			Clk <= '0';
			
			data <= x"0fbb";
			DA <= "0111";
			wait for 10ns;
			Clk <= '1';
			wait for 10ns;
			Clk <= '0';
			
			data <= x"0fcc";
			DA <= "1000";
			wait for 10ns;
			Clk <= '1';
			wait for 10ns;
			Clk <= '0';
			
			AA <= "0000";
			BA <= "0001";
			wait for 10ns;
			
			AA <= "0010";
			BA <= "0011";
			wait for 10ns;
			
			AA <= "0100";
			BA <= "0101";
			wait for 10ns;
			
			AA <= "0110";
			BA <= "0111";
			wait for 10ns;
			
			AA <= "1000";
			BA <= "1000";
			wait for 10ns;
			
			wait;
	end process;
	
end Behavioral;
			
	