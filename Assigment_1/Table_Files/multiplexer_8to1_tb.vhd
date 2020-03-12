library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexer_8to1_tb is
end multiplexer_8to1_tb;

architecture Behavioral of multiplexer_8to1_tb is
	component multiplexer_8to1 is
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
	     		s2: in std_logic;
	      
	      		Z: out std_logic_vector(15 downto 0)
		);
	end component;
	
	signal i0 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal i1 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal i2 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal i3 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal i4 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal i5 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal i6 : std_logic_vector(15 downto 0):= "0000000000000000";
	signal i7 : std_logic_vector(15 downto 0):= "0000000000000000";

	signal s0 : std_logic := '0';
	signal s1 : std_logic := '0';
	signal s2 : std_logic := '0';

	signal Z : std_logic_vector(15 downto 0):= "0000000000000000";

begin

	UUT: multiplexer_8to1
	PORT MAP(
		i0 => i0,
		i1 => i1,
		i2 => i2,
		i3 => i3,
		i4 => i4,
		i5 => i5,
		i6 => i6,
		i7 => i7,
		s0 => s0,
		s1 => s1, 
		s2 => s2,
		Z => Z
	);

simulation_process :process
begin
	i0<= x"00AA";
	i1<= x"00BB";
	i2<= x"00CC";
	i3<= x"00DD";
	i4<= x"00EE";
	i5<= x"00FF";
	i6<= x"00AA";
	i7<= x"00BB";

	s0 <= '0';
	s1 <= '0';
	s2 <= '0';
	wait for 5ns;


	s0 <= '0';
	s1 <= '0';
	s2 <= '1';
	wait for 5ns;

	s0 <= '0';
	s1 <= '1';
	s2 <= '0';
	wait for 5ns;

	s0 <= '0';
	s1 <= '1';
	s2 <= '1';
	wait for 5ns;

	s0 <= '1';
	s1 <= '0';
	s2 <= '0';
	wait for 5ns;

	s0 <= '1';
	s1 <= '0';
	s2 <= '1';
	wait for 5ns;

	s0 <= '1';
	s1 <= '1';
	s2 <= '0';
	wait for 5ns;

	s0 <= '1';
	s1 <= '1';
	s2 <= '1';
	wait for 5ns;
end process;
end Behavioral;
		
