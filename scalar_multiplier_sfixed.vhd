library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Common.all;

library ieee_proposed;
use IEEE_PROPOSED.fixed_pkg.all;

entity scalar_multiplier_sfixed is
    Port ( scalar : in  sfixed (7 downto -8);
			  nn_in : in sfixed16_fixed_point_type;  
           nn_out : out sfixed_fixed_point_type
			  );
end scalar_multiplier_sfixed;

architecture Behavioral of scalar_multiplier_sfixed is

begin

  nn_out(0) <= scalar * nn_in(0);
  nn_out(1) <= scalar * nn_in(1);
  nn_out(2) <= scalar * nn_in(2);
  nn_out(3) <= scalar * nn_in(3);
  nn_out(4) <= scalar * nn_in(4);
  nn_out(5) <= scalar * nn_in(5);
  nn_out(6) <= scalar * nn_in(6);
  nn_out(7) <= scalar * nn_in(7);

end Behavioral;

