library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library ieee_proposed;
use IEEE_PROPOSED.fixed_pkg.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Common.all;

entity tb_binary_connect is
end tb_binary_connect;
architecture Behavioral of tb_binary_connect is

component scalar_multiplier_sfixed
   Port ( scalar : in  sfixed (7 downto -8);
			  nn_in : in sfixed16_fixed_point_type;  
           nn_out : out sfixed_fixed_point_type);
	end component;

component accumulator
   Port ( i_clk : in std_logic;
		nn_in : in sfixed16_fixed_point_type;
		weights : in matrix_bin_type;
		nn_out : out sfixed16_fixed_point_type);
	end component;	
	
	--Inputs
   signal weights : matrix_bin_type;
	signal nn_in : sfixed16_fixed_point_type;
	signal scalar : sfixed (8 downto -7);
	signal i_clk : std_logic := '0';

   --Intermediate Nodes
	signal nn_after_accum : sfixed16_fixed_point_type;

   --Outputs
	signal nn_out : sfixed_fixed_point_type;
	
	--Testbench Related
   constant period : time := 10 ns;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   accum: accumulator PORT MAP (
          i_clk => i_clk,
			 weights => weights,
			 nn_in => nn_in,
			 nn_out => nn_after_accum
        );
   
	sm0: scalar_multiplier_sfixed PORT MAP (
          scalar => scalar,
			 nn_in => nn_after_accum,
			 nn_out => nn_out
        );

   -- process definitions
   process1 :process
   variable i : integer := 0;
	begin
		  -- assign 8x8 weight matrix (binary)
		  weights <= (x"01",x"33",x"45",x"67",x"89",x"AB",x"CD",x"EF");
		  -- assign 1x8 input matrix (fixed point)
		  nn_in <= (to_sfixed(1.25 , 7,-8),
						to_sfixed(3.75 , 7,-8),
						to_sfixed(1.25 , 7,-8),
						to_sfixed(3.75 , 7,-8),
						to_sfixed(-3.25 , 7,-8),
						to_sfixed(-4.25 , 7,-8),
						to_sfixed(0.75 , 7,-8),
						to_sfixed(0.75 , 7,-8));
		  -- scalar from weights normalization
		  scalar <= to_sfixed (2.5,7,-8);
		  wait for period;
		
   end process;
 
	process0 : process 
	begin
		wait for period/2;
		i_clk <= not i_clk;
	end process process0; 
end Behavioral;

