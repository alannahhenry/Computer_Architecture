library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datapath is
	Port(
		write: in std_logic;
		d_address: in std_logic_vector(2 downto 0);
		a_address: in std_logic_vector(2 downto 0);
		b_address: in std_logic_vector(2 downto 0);
		constant_in: in std_logic_vector(15 downto 0);
		mb_sel: in std_logic;
		data_in: in std_logic_vector(15 downto 0);
		md_sel: in std_logic;
		fs: in std_logic_vector(4 downto 0);
		clk : in std_logic;
		
		address_out: out std_logic_vector(15 downto 0);
		data_out: out std_logic_vector(15 downto 0);
		v, c, n, z: out std_logic
	);
end datapath;

architecture Behavioral of datapath is

	component register_file
		Port(
			write : in std_logic;
			d_address: in std_logic_vector(2 downto 0);
			a_address: in std_logic_vector(2 downto 0);
			b_address: in std_logic_vector(2 downto 0);
			
			d_data: in std_logic_vector(15 downto 0);
			a_data: out std_logic_vector(15 downto 0);
			b_data:  suttd_logic_vector(15 downto 0);
			clk: in std_logic
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
		f_select: in std_logic_vector(4 downto 0);
		f: out std_logic_vector(15 downto 0);
		v, c, n, z: out std_logic
	);
	end component;
	
	signal d_data, a_data, b_data: std_logic_vector(15 downto 0);
	signal mux_b_z: std_logic_vector(15 downto 0);
	signal f: std_logic_vector(15 downto 0);
	
begin

	rf: register_file
		Port Map(
			write => write,
            d_address => d_address,
            a_address => a_address,
            b_address => b_address,
            d_data => d_data,
            a_data => a_data,
            b_data => b_data,
            clk => clk
		);
		
	fu: functional_unit
		Port Map(
			a => a_data,
			b => mux_b_z,
			fs => f_select,
			f => f,
			v => v,
			c => c, 
			n => n,
			z => z
		);
		
	mux_d: multiplexer_2to1
		Port Map(
			i0 => f,
			i1 => data_in,
			s => md_sel,
			Z => d_data
		);
		
	data_out <= mux_b_z;
	address_out <= a_data;
	
end Behavioral;
	