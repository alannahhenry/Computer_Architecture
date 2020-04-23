library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ripple_adder16 is
	Port(
			A: in std_logic_vector(15 downto 0);
			B: in std_logic_vector(15 downto 0);
			C_in: in std_logic;
			S: out std_logic_vector(15 downto 0);
			C_out: out std_logic;
			V: out std_logic
		);
end ripple_adder16;


architecture Behavioral of ripple_adder16 is	

	component full_adder
		Port(
			A: in std_logic;
			B: in std_logic;
			C_in: in std_logic;
			S: out std_logic;
			C_out: out std_logic
		);
	end component;
	
signal c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16: std_logic;
	
begin
	fa00: full_adder
		Port Map(
			A => A(0),
			B => B(0),
			C_in => C_in,
			S => S(0),
			C_out => c1
		);
	
	fa01: full_adder
		Port Map(
			A => A(1),
			B => B(1),
			C_in => C_in,
			S => S(1),
			C_out => c2
		);
	
	fa02: full_adder
		Port Map(
			A => A(2),
			B => B(2),
			C_in => C_in,
			S => S(2),
			C_out => c3
		);
	fa03: full_adder
		Port Map(
			A => A(3),
			B => B(3),
			C_in => C_in,
			S => S(3),
			C_out => c4
		);	
	
	fa04: full_adder
		Port Map(
			A => A(4),
			B => B(4),
			C_in => C_in,
			S => S(4),
			C_out => c5
		);
	
	fa05: full_adder
		Port Map(
			A => A(5),
			B => B(5),
			C_in => C_in,
			S => S(5),
			C_out => c6
		);
	
	fa06: full_adder
		Port Map(
			A => A(6),
			B => B(6),
			C_in => C_in,
			S => S(6),
			C_out => c7
		);
	
	fa07: full_adder
		Port Map(
			A => A(7),
			B => B(7),
			C_in => C_in,
			S => S(7),
			C_out => c8
		);
	
	fa08: full_adder
		Port Map(
			A => A(8),
			B => B(8),
			C_in => C_in,
			S => S(8),
			C_out => c9
		);
	
	fa09: full_adder
		Port Map(
			A => A(9),
			B => B(9),
			C_in => C_in,
			S => S(9),
			C_out => c10
		);
	
	fa10: full_adder
		Port Map(
			A => A(10),
			B => B(10),
			C_in => C_in,
			S => S(10),
			C_out => c11
		);
	
	fa11: full_adder
		Port Map(
			A => A(11),
			B => B(11),
			C_in => C_in,
			S => S(11),
			C_out => c12
		);
	
	fa12: full_adder
		Port Map(
			A => A(12),
			B => B(12),
			C_in => C_in,
			S => S(12),
			C_out => c13
		);
	
	fa13: full_adder
		Port Map(
			A => A(13),
			B => B(13),
			C_in => C_in,
			S => S(13),
			C_out => c14
		);
	
	fa14: full_adder
		Port Map(
			A => A(14),
			B => B(14),
			C_in => C_in,
			S => S(14),
			C_out => c15
		);
	
	fa15: full_adder
		Port Map(
			A => A(15),
			B => B(15),
			C_in => C_in,
			S => S(15),
			C_out => c16
		);
	
	C_out <= c16;
	V <= c15 xor c16;

end Behavioral;