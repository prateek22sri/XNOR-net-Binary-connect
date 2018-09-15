library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- currently hardcoded for "batch size" of 8
--package Common is 
--	type vector_fixed_point_type is array (7 downto 0) of std_logic_vector(31 downto 0);
--	--type vector_bin_type is array (7 downto 0) of std_logic;
--	type matrix_fixed_point_type is array (7 downto 0) of vector_fixed_point_type;
--	type matrix_bin_type is array (7 downto 0) of std_logic_vector(7 downto 0);
--end Common;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Common.all;

entity tb_xnor_popcount_8 is
end tb_xnor_popcount_8;
architecture Behavioral of tb_xnor_popcount_8 is

component xnor_popcount_8
   Port ( weights : in  matrix_bin_type;
			  nn_in : in std_logic_vector(7 downto 0);
           nn_out : out vector_fixed_point_type);
	end component;
	
	--Inputs
   signal weights : matrix_bin_type;
	signal nn_in : std_logic_vector(7 downto 0);

   --Outputs
	signal nn_out : vector_fixed_point_type;
	
	--Testbench Related
   constant period : time := 10 ns;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: xnor_popcount_8 PORT MAP (
          weights => weights,
			 nn_in => nn_in,
			 nn_out => nn_out
        );

   -- process definitions
   process1 :process
   variable i : integer := 0;
	begin
		  -- assign 8x8 weight matrix (binary)
		  weights <= (x"01",x"33",x"45",x"67",x"89",x"AB",x"CD",x"EF");
		  -- assign 1x8 input matrix (binary)
		  nn_in <= x"63";
		  wait for period;
		
   end process;
 
   -- Stimulus process
--   stim_proc: process
--   begin		
--      wait for period/2;
--      CLK <= not CLK;
--   end process;

end Behavioral;

