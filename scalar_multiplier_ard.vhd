library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Common.all;

library ieee_proposed;
use IEEE_PROPOSED.fixed_pkg.all;

entity scalar_multiplier_ard is
    Port ( scalar : in  sfixed (7 downto -8);
			  nn_in : in vector_fixed_point_type;  
           nn_out : out sfixed_fixed_point_type
			  );
end scalar_multiplier_ard;

architecture Behavioral of scalar_multiplier_ard is

begin

  nn_out(0) <= scalar * to_sfixed(to_integer(unsigned(nn_in(0)(31 downto 16))),7,-8);
  nn_out(1) <= scalar * to_sfixed(to_integer(unsigned(nn_in(1)(31 downto 16))),7,-8);
  nn_out(2) <= scalar * to_sfixed(to_integer(unsigned(nn_in(2)(31 downto 16))),7,-8);
  nn_out(3) <= scalar * to_sfixed(to_integer(unsigned(nn_in(3)(31 downto 16))),7,-8);
  nn_out(4) <= scalar * to_sfixed(to_integer(unsigned(nn_in(4)(31 downto 16))),7,-8);
  nn_out(5) <= scalar * to_sfixed(to_integer(unsigned(nn_in(5)(31 downto 16))),7,-8);
  nn_out(6) <= scalar * to_sfixed(to_integer(unsigned(nn_in(6)(31 downto 16))),7,-8);
  nn_out(7) <= scalar * to_sfixed(to_integer(unsigned(nn_in(7)(31 downto 16))),7,-8);

end Behavioral;

