library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library ieee_proposed;
use IEEE_PROPOSED.fixed_pkg.all;

use work.Common.all;

entity accumulator_tb is
end accumulator_tb;
architecture Behavioral of accumulator_tb is

component accumulator
   Port ( i_clk : in std_logic;
		nn_in : in sfixed16_fixed_point_type;
		weights : in matrix_bin_type;
		nn_out : out sfixed_fixed_point_type);
	end component;
	
	--Inputs
	signal i_clk : std_logic := '0';
   signal weights : matrix_bin_type;
	signal nn_in : sfixed16_fixed_point_type;

   --Outputs
	signal nn_out : sfixed_fixed_point_type;
	
	--Testbench Related
   constant period : time := 10 ns;
   
BEGIN
 
-- 		  -- assign 8x8 weight matrix (binary)
		  weights <= (x"01",x"33",x"45",x"67",x"89",x"AB",x"CD",x"EF");
--		  -- assign 1x8 input matrix (binary)
		  nn_in <= (to_sfixed(1.25 , 7,-8),
						to_sfixed(3.75 , 7,-8),
						to_sfixed(1.25 , 7,-8),
						to_sfixed(3.75 , 7,-8),
						to_sfixed(1.25 , 7,-8),
						to_sfixed(1.25 , 7,-8),
						to_sfixed(3.75 , 7,-8),
						to_sfixed(1.25 , 7,-8));
 
	-- Instantiate the Unit Under Test (UUT)
   uut: accumulator PORT MAP (
          i_clk => i_clk,
			 weights => weights,
			 nn_in => nn_in,
			 nn_out => nn_out
        );

	process0 : process is
	begin
		wait for period/2;
		i_clk <= not i_clk;
	end process process0; 

<<<<<<< HEAD
=======
   -- process definitions
   process1 :process
   variable i : integer := 0;
	begin
			nn_out <= (to_sfixed(0 , 15,-16),
						to_sfixed(0 , 15,-16),
						to_sfixed(0 , 15,-16),
						to_sfixed(0 , 15,-16),
						to_sfixed(0 , 15,-16),
						to_sfixed(0 , 15,-16),
						to_sfixed(0 , 15,-16),
						to_sfixed(0 , 15,-16));
--		  -- assign 8x8 weight matrix (binary)
		  weights <= (x"01",x"33",x"45",x"67",x"89",x"AB",x"CD",x"EF");
		  -- assign 1x8 input matrix (binary)
		  nn_in <= (to_sfixed(1.25 , 15,-16),
						to_sfixed(3.75 , 15,-16),
						to_sfixed(1.25 , 15,-16),
						to_sfixed(3.75 , 15,-16),
						to_sfixed(1.25 , 15,-16),
						to_sfixed(1.25 , 15,-16),
						to_sfixed(3.75 , 15,-16),
						to_sfixed(1.25 , 15,-16));
		  wait for period;
		
   end process;
 
   -- Stimulus process
--   stim_proc: process
--   begin		
--      wait for period/2;
--      CLK <= not CLK;
--   end process;

>>>>>>> 631bb508c87db981a696530c2b8d1076218610df
end Behavioral;
