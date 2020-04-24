library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_memory_tb
end control_memory_tb;

architecture Behavioral of control_memory_tb is
	
	component control_memory
		Port(
			MM: out std_logic;
			MW: out std_logic;
			RW: out std_logic;
			MD: out std_logic;
			FS: out std_logic_vector(4 downto 0);
			MB: out std_logic;
			TB: out std_logic;
			TA: out std_logic;
			TD: out std_logic;
			PI: out std_logic;
			PL: out std_logic;
			IL: out std_logic;
			MC: out std_logic;
			MS: out std_logic_vector(2 downto 0);
			NA: out std_logic_vector(7 downto 0);
			IN_CAR: out std_logic_vector(7 downto 0);
		);
	end component;
	
	signal MW, MM, RW, MD, MB, TB, TA, TD, PI, PL, IL, MC : std_logic := '0';
	signal MS : std_logic_vector(2 down 0):= "000";
	signal FS : std_logic_vector(4 downto 0):= "00000";
	signal NA, IN_CAR : std_logic_vector(7 downto 0) :=x"00";

begin 
	uut: control_memory
		Port Map(
			MM => MM,
			MW => MW,
			RW => RW,
			MD => MD,
			FS => FS,
			MB => MB,
			TB => TB,
			TA => TA,
			TD => TD,
			PI => PI,
			PL => PL,
			IL => IL,
			MC => MC,
			MS => MS,
			NA => NA,
			IN_CAR => IN_CAR
		);
	
	sim: process
		begin
			IN_CAR <= x"C0";
			wait for 10ns;
			
			IN_CAR <= x"30";
			wait for 10ns;
			
			IN_CAR <= x"00000000";
			wait for 10ns;
			
			IN_CAR <= x"00000100";
			wait for 10ns;
			
		end process;
end Behavioral;
			