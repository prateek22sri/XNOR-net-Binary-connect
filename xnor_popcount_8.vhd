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

-- Include "use work.Common.all;" in all files utilizing our defined types

entity xnor_popcount_8 is
    Port ( weights : in  matrix_bin_type;
			  nn_in : in std_logic_vector(7 downto 0);
           nn_out : out vector_fixed_point_type
			  );
end xnor_popcount_8;

architecture Behavioral of xnor_popcount_8 is

component Popcount_8
   port ( input_vector : in  STD_LOGIC_VECTOR(31 downto 0);
           count : out  STD_LOGIC_VECTOR(7 downto 0)
			  );
	end component;

   -- this is where we store xnor results
	signal xnor_0,xnor_1,xnor_2,xnor_3,xnor_4,xnor_5,xnor_6,xnor_7 : std_logic_vector(7 downto 0);
  
begin

   -- compute xnor results
	xnor_0 <= nn_in XNOR weights(0);
	xnor_1 <= nn_in XNOR weights(1);
	xnor_2 <= nn_in XNOR weights(2);
	xnor_3 <= nn_in XNOR weights(3);
	xnor_4 <= nn_in XNOR weights(4);
	xnor_5 <= nn_in XNOR weights(5);
	xnor_6 <= nn_in XNOR weights(6);
	xnor_7 <= nn_in XNOR weights(7);
	
	-- initialize fixed point outputs (32 bit fixed point (16,16))
	nn_out(0)(31 downto 24) <= x"00";
	nn_out(1)(31 downto 24) <= x"00";
	nn_out(2)(31 downto 24) <= x"00";
	nn_out(3)(31 downto 24) <= x"00";
	nn_out(4)(31 downto 24) <= x"00";
	nn_out(5)(31 downto 24) <= x"00";
	nn_out(6)(31 downto 24) <= x"00";
	nn_out(7)(31 downto 24) <= x"00";
	nn_out(0)(15 downto 0) <= x"0000";
	nn_out(1)(15 downto 0) <= x"0000";
	nn_out(2)(15 downto 0) <= x"0000";
	nn_out(3)(15 downto 0) <= x"0000";
	nn_out(4)(15 downto 0) <= x"0000";
	nn_out(5)(15 downto 0) <= x"0000";
	nn_out(6)(15 downto 0) <= x"0000";
	nn_out(7)(15 downto 0) <= x"0000";
	
	-- compute popcount of xnor results. Note that we are storing output as 32 bit fixed point 16,16
	pop0: Popcount_8 PORT MAP (input_vector => x"00" & xnor_0 & x"0000" , count => nn_out(0)(23 downto 16));
   pop1: Popcount_8 PORT MAP (input_vector => x"00" & xnor_1 & x"0000" , count => nn_out(1)(23 downto 16));
	pop2: Popcount_8 PORT MAP (input_vector => x"00" & xnor_2 & x"0000" , count => nn_out(2)(23 downto 16));
	pop3: Popcount_8 PORT MAP (input_vector => x"00" & xnor_3 & x"0000" , count => nn_out(3)(23 downto 16));
	pop4: Popcount_8 PORT MAP (input_vector => x"00" & xnor_4 & x"0000" , count => nn_out(4)(23 downto 16));
	pop5: Popcount_8 PORT MAP (input_vector => x"00" & xnor_5 & x"0000" , count => nn_out(5)(23 downto 16));
	pop6: Popcount_8 PORT MAP (input_vector => x"00" & xnor_6 & x"0000" , count => nn_out(6)(23 downto 16));
	pop7: Popcount_8 PORT MAP (input_vector => x"00" & xnor_7 & x"0000" , count => nn_out(7)(23 downto 16));
	
end Behavioral;
