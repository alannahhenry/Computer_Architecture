library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_file_tb is
end register_file_tb;

architecture Behavioral of register_file_tb is 

	component register_file is 
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
			reg7: out std_logic_vector(15 downto 0)
		);
	end component;
	
	signal src_s0 : std_logic := '0';
	signal src_s1 : std_logic := '0';
	signal src_s2 : std_logic := '0';

	signal des_A : std_logic := '0';
	signal des_B : std_logic := '0';
	signal des_C : std_logic := '0';
	
	signal Clk : std_logic := '0';
	signal data_src : std_logic :='0';
	signal data : std_logic_vector(15 downto 0) := x"0000";
	
	signal reg0: std_logic_vector(15 downto 0):= x"0000"; 
	signal reg1: std_logic_vector(15 downto 0):= x"0000";
	signal reg2: std_logic_vector(15 downto 0):= x"0000";
	signal reg3: std_logic_vector(15 downto 0):= x"0000";
	signal reg4: std_logic_vector(15 downto 0):= x"0000";
	signal reg5: std_logic_vector(15 downto 0):= x"0000";
	signal reg6: std_logic_vector(15 downto 0):= x"0000";
	signal reg7: std_logic_vector(15 downto 0):= x"0000";

begin
	UUT: register_file
	PORT MAP(
		src_s0 => src_s0,
		src_s1 => src_s1, 
		src_s2 => src_s2,
		des_A => des_A,
		des_B => des_B,
		des_C => des_C,
		Clk => Clk,
		data_src => data_src,
		data => data,
		
		reg0 => reg0,
		reg1 => reg1, 
		reg2 => reg2,
		reg3 => reg3,
		reg4 => reg4,
		reg5 => reg5,
		reg6 => reg6,
		reg7 => reg7
	);
	clk_process: process
    
	begin
		clk <= '0';
		wait for 5ns;
		clk <= '1';       
 		wait for 5ns;
    	end process;	
--2)A)
	simulation_process :process
	begin 
		data_src <= '0';
        	
		--000
        	wait for 10ns;
        	
		des_A <= '0';
       		des_B <= '0';
        	des_C <= '0';
        	data <= x"0000";
       
		--001
        	wait for 10ns;
        
		des_A <= '0';
        	des_B <= '0';
        	des_C <= '1';
        	data <= x"1111";
        
       		 --010
        	wait for 10ns;
       
		    des_A <= '0';
        	des_B <= '1';
       		des_C <= '0';
        	data <= x"2222";
        
      		 --011
       		wait for 10ns;
        
		    des_A <= '0';
        	des_B <= '1';
        	des_C <= '1';
        	data <= x"3333";
      
  		--100
		wait for 10ns;
        
		    des_A <= '1';
        	des_B <= '0';
        	des_C <='0';
       		data <= x"4444";
        
       		--101
        	wait for 10ns;
       
		    des_A <= '1';
       		des_B <= '0';
       		des_C <='1';
        	data <= x"5555";
        	
		--110
       		wait for 10ns;
        
		  des_A <= '1';
		  des_B <= '1';
          des_C <= '0';
           data <= x"6666";
        
        
		--111
 		wait for 10ns;
      
		des_A <= '1';
        	des_B <= '1';
       		des_C <= '1';
       		data <= x"7777";
       
    		end process;  

end Behavioral;
			
	
	
