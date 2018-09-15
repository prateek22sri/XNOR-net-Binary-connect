--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
library ieee_proposed;
use IEEE_PROPOSED.fixed_pkg.all;

package Common is 
	type vector_fixed_point_type is array (7 downto 0) of std_logic_vector(31 downto 0);
	type sfixed_fixed_point_type is array (7 downto 0) of sfixed (15 downto -16);
	type sfixed16_fixed_point_type is array (7 downto 0) of sfixed (7 downto -8);
	--type vector_bin_type is array (7 downto 0) of std_logic;
	type matrix_fixed_point_type is array (7 downto 0) of vector_fixed_point_type;
	type matrix_bin_type is array (7 downto 0) of std_logic_vector(7 downto 0);
end Common;

package body Common is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end Common;
