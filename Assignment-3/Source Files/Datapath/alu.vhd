library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu is
	Port(
		a: in std_logic_vector(15 downto 0);
		b: in std_logic_vector(15 downto 0);
		c_in: in std_logic;
		g_sel: in std_logic_vector(2 downto 0);
		c_out: out std_logic;
		v: out std_logic;
		g: out std_logic_vector(15 downto 0)
	);
end alu;

architecture Behavioral of alu is

	component ripple_adder16
		Port(
			A: in std_logic_vector(15 downto 0);
			B: in std_logic_vector(15 downto 0);
			C_in: in std_logic;
			S: out std_logic_vector(15 downto 0);
			C_out: out std_logic;
			V: out std_logic
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
	
	component logic_unit
		Port(
            a: in std_logic_vector(15 downto 0);
            b: in std_logic_vector(15 downto 0);
            s: in std_logic_vector(1 downto 0);
            z: out std_logic_vector(15 downto 0)
		);
	end component;
	
	signal y, arith_z, logic_z : std_logic_vector(15 downto 0);
	
begin
	ra: ripple_adder16	
		Port Map(
			A => a,
			B => y,
			C_in => c_in,
			S => arith_z,
			C_out => c_out,
			V => v
		);
		
	mux: multiplexer_2to1
		Port Map(
			i0 => arith_z,
			i1 => logic_z,
			S => g_sel(2),
			Z => g
		);
		
	lu: logic_unit
		Port Map(
			a => a, 
			b => b, 
			s => g_sel(1 downto	0),
			z => logic_z
			
		);
		
	with g_sel(1 downto 0) select
		y <= x"0000" after 1ns when "00",
			 b after 1ns when "01", 
			 not b after 1ns when "10",
			 x"FFFF" AFTER 1ns when "11",
			 "UUUUUUUUUUUUUUUU" after 1ns when others;

end Behavioral;
