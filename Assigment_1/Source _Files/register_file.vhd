library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_file is 
	Port(
		src_s0: in std_logic;
		src_s1: in std_logic; -- for  8-1 multiplexer
		src_s2: in std_logic;
		
		des_A: in std_logic;
		des_B: in std_logic; -- for decoder
		des_C: in std_logic;

		Clk: in std_logic; -- clock 
		data_src: in std_logic; -- for 2-1`multiplexer

		data: in std_logic_vector(15 downto 0);

		reg0: out std_logic_vector(15 downto 0);
		reg1: out std_logic_vector(15 downto 0);
		reg2: out std_logic_vector(15 downto 0);
		reg3: out std_logic_vector(15 downto 0);
		reg4: out std_logic_vector(15 downto 0);
		reg5: out std_logic_vector(15 downto 0);
		reg6: out std_logic_vector(15 downto 0);
		reg7: out std_logic_vector(15 downto 0);

end register_file;

architecture Behavioral of register_file is
	
	component reg16
	Port(
	     D: in std_logic_vector(15 downto 0);
	     load, Clk: std_logic;
	     Q: out std_logic_vector(15 downto 0);
	);
	end component;
	
	component decoder_3to8
	Port(
	     A: in std_logic;
	     B: in std_logic;
	     C: in std_logic;
	    
	     D0: out std_logic;
	     D1: out std_logic;
	     D2: out std_logic;
	     D3: out std_logic;
	     D4: out std_logic;
	     D5: out std_logic;
	     D6: out std_logic;
	     D7: out std_logic;
	);
	end component;
	
	component multiplexer_2to1
	Port(
	      i0: in std_logic_vector(15 downto 0);
	      i1: in std_logic_vector(15 downto 0);
	      s: in std_logic;
	      Z: out std_logic_vector(15 downto 0);
	);
	end component;

	component multiplexer_8to1
	Port(
	      i0: in std_logic_vector(15 downto 0);
	      i1: in std_logic_vector(15 downto 0);
	      i2: in std_logic_vector(15 downto 0);
	      i3: in std_logic_vector(15 downto 0);
	      i4: in std_logic_vector(15 downto 0);
	      i5: in std_logic_vector(15 downto 0);
	      i6: in std_logic_vector(15 downto 0);
	      i7: in std_logic_vector(15 downto 0);
	      
	      s0: in std_logic;
	      s1: in std_logic;
	      s3: in std_logic;
	      
	      Z: out std_logic_vector(15 downto 0);
	);
	end component;

signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7 : std_logic;
signal reg0_q, reg1_d, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, data_src_mux_out, src_reg: std_logic_vector(15 downto 0);


begin
-- port maps;

--register0
reg 00: reg16 PORTMAP(
	D => data_src_mux_out,
	load => load_reg0,
	Clk => Clk,
	Q => reg0_q
);

--register1
reg 01: reg16 PORTMAP(
	D => data_src_mux_out,
	load => load_reg1,
	Clk => Clk,
	Q => reg1_q
);

--register2
reg 02: reg16 PORTMAP(
	D => data_src_mux_out,
	load => load_reg2,
	Clk => Clk,
	Q => reg2_q
);
--register3
reg 03: reg16 PORTMAP(
	D => data_src_mux_out,
	load => load_reg3,
	Clk => Clk,
	Q => reg3_q
);
--register4
reg 04: reg16 PORTMAP(
	D => data_src_mux_out,
	load => load_reg4,
	Clk => Clk,
	Q => reg4_q
);
--register5
reg 05: reg16 PORTMAP(
	D => data_src_mux_out,
	load => load_reg5,
	Clk => Clk,
	Q => reg5_q
);
--register6
reg 06: reg16 PORTMAP(
	D => data_src_mux_out,
	load => load_reg6,
	Clk => Clk,
	Q => reg6_q
);
--register7
reg 07: reg16 PORTMAP(
	D => data_src_mux_out,
	load => load_reg7,
	Clk => Clk,
	Q => reg7_q
);

-- destination register decoder
des_decoder_3to8: decoder_3to8 PORT MAP(
	A => des_A,
	B => des_B,
	C => des_C,
	D0 => load_reg0,
	D1 => load_reg1,
	D2 => load_reg2,
	D3 => load_reg3,
	D4 => load_reg4,
	D5 => load_reg5,
	D6 => load_reg6,
	D7 => load_reg7
);

--2:1 data src multiplexer
data_src_mux_2to1: multiplexer_2to1 PORT MAP(
	i0 => data,
	i1 => src_reg,
	s => data_src,
	Z => data_src_mux_out
);

--8:1 src register multiplexer
Inst_mux_8to1: mulitplexer_8to1 PORT MAP(
	i0 => req0_q,
	i1 => req1_q,
	i2 => req2_q,
	i3 => req3_q,
	i4 => req4_q,
	i5 => req5_q,
	i6 => req6_q,
	i7 => req7_q,
	
	i0 => src_s0,
	i1 => src_s1,
	i2 => src_s2,

	Z => src_reg
);

reg0 <= reg0_q;
reg1 <= reg1_q;
reg2 <= reg2_q;
reg3 <= reg3_q;
reg4 <= reg4_q;
reg5 <= reg5_q;
reg6 <= reg6_q;
reg7 <= reg7_q;

end Behavioral;
