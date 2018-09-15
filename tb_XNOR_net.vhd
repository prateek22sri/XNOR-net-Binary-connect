library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library ieee_proposed;
use IEEE_PROPOSED.fixed_pkg.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Common.all;

entity tb_XNOR_net is
end tb_XNOR_net;
architecture Behavioral of tb_XNOR_net is

component xnor_popcount_32
   Port ( weights : in  matrix_bin_type;
			  nn_in : in std_logic_vector(7 downto 0);
           nn_out : out vector_fixed_point_type);
	end component;
	
component xnor_popcount_8
   Port ( weights : in  matrix_bin_type;
			  nn_in : in std_logic_vector(7 downto 0);
           nn_out : out vector_fixed_point_type);
	end component;

component scalar_multiplier_ard
   Port ( scalar : in  sfixed (8 downto -7);
			  nn_in : in vector_fixed_point_type;
           nn_out : out sfixed_fixed_point_type);
	end component;	
	
component scalar_multiplier_last
   Port ( scalar : in  sfixed (8 downto -7);
			  nn_in : in sfixed_fixed_point_type;
           nn_out : out sfixed_fixed_point_type);
	end component;		
	--Inputs
   signal weights : matrix_bin_type;
	signal nn_in : std_logic_vector(7 downto 0);
	signal alpha : sfixed (8 downto -7);
	signal beta : sfixed (8 downto -7);

   --Intermediate Nodes
	signal nn_after_pop : vector_fixed_point_type;
	signal nn_after_alpha : sfixed_fixed_point_type;

   --Outputs
	signal nn_out : sfixed_fixed_point_type;
	
	--Clocks
	signal clk : std_logic;
	
	--Testbench Related
   constant period : time := 10 ns;
   
BEGIN
 
	-- feed in binary weights and binary input
   pop: xnor_popcount_8 PORT MAP (
          weights => weights,
			 nn_in => nn_in,
			 nn_out => nn_after_pop
        );
   
	-- multiply by alpha
	sm0: scalar_multiplier_ard PORT MAP (
          scalar => alpha,
			 nn_in => nn_after_pop,
			 nn_out => nn_after_alpha
        );

	-- multiply by beta
	sm1: scalar_multiplier_last PORT MAP (
          scalar => beta,
			 nn_in => nn_after_alpha,
			 nn_out => nn_out
        );
   -- process definitions
   process1 :process
   variable i : integer := 0;
	begin
		  -- simulating RAM operation here
		  
		  -- clock cycle 1
		  wait for period/2;
		  clk <= '0';
		  wait for period/2;
		  clk <= '1';
		  -- assign 8x8 weight matrix (binary)
		  weights <= (x"01",x"33",x"45",x"67",x"89",x"AB",x"CD",x"EF");
		  -- assign 1x8 input matrix (binary)
		  nn_in <= x"63";
		  -- scalar from weights normalization
		  alpha <= to_sfixed (2.5,7,-8);
		  beta <= to_sfixed (2.0,7,-8);
		  
		  -- clock cycle 2
		  wait for period/2;
		  clk <= '0';
		  wait for period/2;
		  clk <= '1';
		  -- assign 8x8 weight matrix (binary)
		  weights <= (x"22",x"55",x"66",x"88",x"11",x"12",x"34",x"71");
		  -- assign 1x8 input matrix (binary)
		  nn_in <= x"A9";
		  -- scalar from weights normalization
		  alpha <= to_sfixed (-1.5,7,-8);
		  beta <= to_sfixed (1.0,7,-8);

		  -- clock cycle 3
		  wait for period/2;
		  clk <= '0';
		  wait for period/2;
		  clk <= '1';
		  -- assign 8x8 weight matrix (binary)
		  weights <= (x"55",x"33",x"45",x"64",x"89",x"AB",x"CD",x"EF");
		  -- assign 1x8 input matrix (binary)
		  nn_in <= x"78";
		  -- scalar from weights normalization
		  alpha <= to_sfixed (5.5,7,-8);
		  beta <= to_sfixed (8.0,7,-8);
		  

end process;
 
   -- Stimulus process
--   stim_proc: process
--   begin		
--      wait for period/2;
--      CLK <= not CLK;
--   end process;

end Behavioral;

