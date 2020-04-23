  
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datapath is
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
		
		FS: in std_logic(4 downto 0);
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
		
		v, c, n, z: out std_logic
	);
end datapath;

architecture Behavioral of datapath is

	component register_file
		Port(
			DA: in std_logic_vector(3 downto 0);
			AA: in std_logic_vector(3 downto 0);
			BA: in std_logic_vector(3 downto 0);
		
			clk: in std_logic;
			RW: in std_logic;
		
			data: in std_logic_vector(15 downto 0);
		
			a_out: std_logic_vector(15 downto 0);
			b_out: std_logic_vector(15 downto 0);
		
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
		
	component multiplexer_2to1
		Port(
			i0: in std_logic_vector(15 downto 0);
			i1: in std_logic_vector(15 downto 0);
			s: in std_logic;
			Z: out std_logic_vector(15 downto 0)
		);
	end component;
	
	component functional_unit
	Port(
		a, b: in std_logic_vector(15 downto 0);
		fs: in std_logic_vector(4 downto 0);
		f: out std_logic_vector(15 downto 0);
		v, c, n, z: out std_logic
	);
	end component;
	
	component zerofill
		Port(
			 SB : in std_logic_vector(2 downto 0);
			`zeroFill : out std_logic_vector(15 downto 0)
		);
	end component;
	
	signal Data, BOut, ABus, BBus, Fsig, ConIn : std_logic_vector(15 downto 0);
	
begin

	rf: register_file
		Port Map(
			AA => Asel,
			BA => Bsel,
			DA => Dsel, 
			RW => RW,
			Clk => Clk,
			
			data => Data,
			
			reg0 =>reg_0_out,
			reg1 =>reg_2_out,
			reg2 =>reg_0_out,
			reg3 =>reg_3_out,
			reg4 =>reg_4_out,
			reg5 =>reg_5_out,
			reg6 =>reg_6_out,
			reg7 =>reg_7_out,
			reg8 =>reg_8_out,
		);
		
	mux_b : multiplexer_2to1
	   Port Map(
	       i0 => BOut,
	       i1 => ConIn,
	       s => MB,
	       Z => BBus
	   );
		
	fu: functional_unit
		Port Map(
			a => ABus,
			b => BBus,
			fs => FS,
			f => Fsig,
			v => v,
			c => c, 
			n => n,
			z => z
		);
		
	mux_d: multiplexer_2to1
		Port Map(
			i0 => Fsig,
			i1 => data_in,
			s => MD,
			Z => Data
		);
	
	fill_zero : zerofill
		Port Map(
			SB => SB,
			zeroFill
		);
		
	data_out <= BBus;
	--address_out <= a_data;
	
end Behavioral;