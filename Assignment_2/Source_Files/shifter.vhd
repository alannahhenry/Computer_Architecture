library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shifter is
	Port(
		B: in std_logic_vector(15 downto 0);
		S: in std_logic_vector(1 downto 0);
		IL: in std_logic;
		IR: in std_logic;
		H: out std_logic_vector(15 downto 0)
	);
end shifter;

architecture Behavioral of shifter is
	
	component multiplexer_3to1
		Port(
			i0, i1, i2: in std_logic;
			s: std_logic_vector(1 downto 0);
			z: out std_logic
		);
	end component;
	
begin
	mux00: multiplexer_3to1
		Port Map(
			i0 => B(0),
			i1 => B(1), 
			i2 => IL,
			s => S,
			z => H(0)
		);
		
	mux01: multiplexer_3to1
		Port Map(
			i0 => B(1),
			i1 => B(2), 
			i2 => B(0),
			s => S,
			z => H(1)
		);
		
	mux02: multiplexer_3to1
		Port Map(
			i0 => B(2),
			i1 => B(3), 
			i2 => B(1),
			s => S,
			z => H(2)
		);
		
	mux03: multiplexer_3to1
		Port Map(
			i0 => B(3),
			i1 => B(4), 
			i2 => B(2),
			s => S,
			z => H(3)
		);
		
	mux04: multiplexer_3to1
		Port Map(
			i0 => B(4),
			i1 => B(5), 
			i2 => B(1),
			s => S,
			z => H(4)
		);
		
	mux05: multiplexer_3to1
		Port Map(
			i0 => B(5),
			i1 => B(6), 
			i2 => B(4),
			s => S,
			z => H(5)
		);
		
	mux06: multiplexer_3to1
		Port Map(
			i0 => B(6),
			i1 => B(7), 
			i2 => B(5),
			s => S,
			z => H(6)
		);
		
	mux07: multiplexer_3to1
		Port Map(
			i0 => B(7),
			i1 => B(8), 
			i2 => B(6),
			s => S,
			z => H(7)
		);
		
	mux08: multiplexer_3to1
		Port Map(
			i0 => B(8),
			i1 => B(9), 
			i2 => B(7),
			s => S,
			z => H(8)
		);
		
	mux09: multiplexer_3to1
		Port Map(
			i0 => B(9),
			i1 => B(10), 
			i2 => B(8),
			s => S,
			z => H(9)
		);
		
	mux10: multiplexer_3to1
		Port Map(
			i0 => B(10),
			i1 => B(11), 
			i2 => B(9),
			s => S,
			z => H(10)
		);
		
	mux11: multiplexer_3to1
		Port Map(
			i0 => B(11),
			i1 => B(12), 
			i2 => B(10),
			s => S,
			z => H(11)
		);
		
		
	mux12: multiplexer_3to1
		Port Map(
			i0 => B(12),
			i1 => B(13), 
			i2 => B(11),
			s => S,
			z => H(12)
		);
		
	mux13: multiplexer_3to1
		Port Map(
			i0 => B(13),
			i1 => B(14), 
			i2 => B(12),
			s => S,
			z => H(13)
		);
		
	mux14: multiplexer_3to1
		Port Map(
			i0 => B(14),
			i1 => B(15), 
			i2 => B(13),
			s => S,
			z => H(14)
		);
		
	mux15: multiplexer_3to1
		Port Map(
			i0 => B(15),
			i1 => IL, 
			i2 => IR,
			s => S,
			z => H(15)
		);
end Behavioral;
		
		