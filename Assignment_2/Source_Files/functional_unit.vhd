library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity functional_unit is
	Port(
		a, b: in std_logic_vector(15 downto 0);
		f_select: in std_logic_vector(4 downto 0);
		f: out std_logic_vector(15 downto 0);
		v, c, n, z: out std_logic
	);
end functional_unit;

architecture Behavioral of functional_unit is

	component alu
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
	
	component shifter 
		Port(
			B: in std_logic_vector(15 downto 0);
			S: in std_logic_vector(1 downto 0);
			IL: in std_logic;
			IR: in std_logic;
			H: out std_logic_vector(15 downto 0)
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
	
	component zero_detect
		Port(
			a: in std_logic_vector(15 downto 0);
			z: out std_logic
		);
	end component;
	
	signal g, h: std_logic_vector(15 downto 0);
	
begin

	alu16: alu
		Port Map(
			a => a,
			b => b,
			c_in => f_select(0),
			g_sel => f_select(3 downto 1);
			c_out => c,
			v => v,
			g => g
		);
		
	shifter16: shifter
		Port Map (
			B => b,
			S => f_select(3 downto 2),
			IL => '0',
			IR => '0',
			H => h
		);
		
	mux_mf: multiplexer_2to1
		Port Map(
			i0 => g,
			i1 => h, 
			s => f_select(4),
			Z => f
		);
		
	n <= g(15);
	
end Behavioral;