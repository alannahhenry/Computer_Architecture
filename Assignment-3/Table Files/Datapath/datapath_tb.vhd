library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datapath_tb is
end datapath_tb;

architecture Behavioral of datapath_tb is
	
	component datapath is
		Port(
			data_in: in std_logic_vector(15 downto 0);
			pc_in: in std_logic_vector(15 downto 0);
			SB: in std_logic_vector(2 downto 0);
			
			MB: in std_logic;
			MD: in std_logic;
			MM: in std_logic;
			
			Dsel: in std_logic_vector(3 downto 0);
			Asel: in std_logic_vector(3 downto 0);
			Bsel: in std_logic_vector(3 downto 0);
			
			FS: in std_logic_vector(4 downto 0);
			RW: in std_logic;
			Clk: in std_logic;
			
			adr_out: out std_logic_vector(15 downto 0);
			data_out: out std_logic_vector(15 downto 0);
			
			reg_0_out: out std_logic_vector(15 downto 0);
			reg_1_out: out std_logic_vector(15 downto 0);
			reg_2_out: out std_logic_vector(15 downto 0);
			reg_3_out: out std_logic_vector(15 downto 0);
			reg_4_out: out std_logic_vector(15 downto 0);
			reg_5_out: out std_logic_vector(15 downto 0);
			reg_6_out: out std_logic_vector(15 downto 0);
			reg_7_out: out std_logic_vector(15 downto 0);
			reg_8_out: out std_logic_vector(15 downto 0);
			
			v, c, n, z : out std_logic
			
		);
	end component;
	
	--input signals
	signal data_in, PC_in: std_logic_vector(15 downto 0):=  x"0000";
	signal Dsel, Asel, Bsel: std_logic_vector(3 downto 0):= "0000";
	signal MB, MD, MM, RW, Clk :std_logic:= '0';
	signal SB: std_logic_vector(2 downto 0):= "000";
	signal FS: std_logic_vector(4 downto 0):= "00000";
	
	--output signals
	signal Vflag, Cflag, Nflag, Zflag: std_logic := '0';
	signal adr_out: std_logic_vector(15 downto 0) := x"0000";
	signal data_out: std_logic_vector(15 downto 0) := x"0000";
	signal reg_0_data_out: std_logic_vector(15 downto 0):=  x"0000";
	signal reg_1_data_out: std_logic_vector(15 downto 0):=  x"0000";
	signal reg_2_data_out: std_logic_vector(15 downto 0):=  x"0000";
	signal reg_3_data_out: std_logic_vector(15 downto 0):=  x"0000";
	signal reg_4_data_out: std_logic_vector(15 downto 0):=  x"0000";
	signal reg_5_data_out: std_logic_vector(15 downto 0):=  x"0000";
	signal reg_6_data_out: std_logic_vector(15 downto 0):=  x"0000";
	signal reg_7_data_out: std_logic_vector(15 downto 0):=  x"0000";
	signal reg_8_data_out: std_logic_vector(15 downto 0):=  x"0000";
	
	
	begin
		uut: datapath
			Port Map(
				data_in => data_in,
				PC_in => PC_in,
				SB => SB, 
				
				Dsel => Dsel,
				Asel => Asel,
				Bsel => Bsel,
				
				FS => FS,
				RW => RW,
				Clk => Clk,
				
				adr_out => adr_out,
				data_out => data_out,
				
				reg_0_out => reg_0_data_out,
				reg_1_out => reg_1_data_out,
				reg_2_out => reg_2_data_out,
				reg_3_out => reg_3_data_out,
				reg_4_out => reg_4_data_out,
				reg_5_out => reg_5_data_out,
				reg_6_out => reg_6_data_out,
				reg_7_out => reg_7_data_out,
				reg_8_out => reg_8_data_out,
				
				v => Vflag,
				c => Cflag,
				n => Nflag,
				z => Zflag
		);
		
	sim: process
	begin
	
		RW <= '1';
		MM <= '0'
		PC_in <= x"0000";
		MD <= '1';
		MB <= '0';
		
		--reg0
		data_in <= x"00fa";
		Dsel <= "0000";
		Clk <= '1';
		wait for 50ns;
		Clk <='0';
		wait for 50ns;
		
		--reg1
		data_in <= x"00fb";
		Dsel <= "0001";
		Clk <= '1';
		wait for 50ns;
		Clk <='0';
		wait for 50ns;
		
		--reg2
		data_in <= x"00fc";
		Dsel <= "0010";
		Clk <= '1';
		wait for 50ns;
		Clk <='0';
		wait for 50ns;
		
		--reg3
		data_in <= x"00fd";
		Dsel <= "0011";
		Clk <= '1';
		wait for 50ns;
		Clk <='0';
		wait for 50ns;
		
		--reg4
		data_in <= x"00fe";
		Dsel <= "0100";
		Clk <= '1';
		wait for 50ns;
		Clk <='0';
		wait for 50ns;
		
		--reg5
		data_in <= x"00ff";
		Dsel <= "0101";
		Clk <= '1';
		wait for 50ns;
		Clk <='0';
		wait for 50ns;
		
		--reg6
		data_in <= x"0faa";
		Dsel <= "0110";
		Clk <= '1';
		wait for 50ns;
		Clk <='0';
		wait for 50ns;
		
		--reg7
		data_in <= x"0fab";
		Dsel <= "0111";
		Clk <= '1';
		wait for 50ns;
		Clk <='0';
		wait for 50ns;
		
		--temp 
		data_in <= x"0fac";
		Dsel <= "1000";
		Clk <= '1';
		wait for 50ns;
		Clk <='0';
		wait for 50ns;
		
		-- Test Abus (select reg5)
		Asel <="0101";
		wait for 50ns;
		
		--Test Bbus (select reg3)
		Bsel <= "0011";
		wait for 50ns;
		
		
		RW <= '0';
		MM <= '1';
		MD <= '1';
		MB <= '0';
		
		pc_in <=x"CCCC";
		wait for 50ns;
		
		SB <= "101";
		MB <= '1';
		wait for 50ns;
		
		wait;
		
	end process;
	
end Behavioral;
		
		
		
		
	