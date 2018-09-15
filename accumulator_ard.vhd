library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Common.all;

library ieee_proposed;
use IEEE_PROPOSED.fixed_pkg.all;

entity accumulator is 
	port(
		i_clk : in std_logic;
		nn_in : in sfixed16_fixed_point_type;
		weights : in matrix_bin_type;
		nn_out : out sfixed_fixed_point_type);
end accumulator;

architecture Behavioral of accumulator is	

	signal s0 : sfixed(7 downto -8);
	signal s1 : sfixed(7 downto -8);
	signal s2 : sfixed(7 downto -8);
	signal s3 : sfixed(9 downto -8);
	signal s4 : sfixed(15 downto -16);
	signal s : std_logic;
	signal w0z : sfixed(7 downto -8);
	signal w0s0 : sfixed(8 downto -8);
	signal w0s1 : sfixed(9 downto -8);
	signal w0s2 : sfixed(10 downto -8);
	signal w0s3 : sfixed(11 downto -8);
	signal w0s4 : sfixed(12 downto -8);
	signal w0s5 : sfixed(13 downto -8);
	signal w0s6 : sfixed(14 downto -8);
	signal w0s7 : sfixed(15 downto -8);

	signal w1s0 : sfixed(8 downto -8);
	signal w1s1 : sfixed(9 downto -8);
	signal w1s2 : sfixed(10 downto -8);
	signal w1s3 : sfixed(11 downto -8);
	signal w1s4 : sfixed(12 downto -8);
	signal w1s5 : sfixed(13 downto -8);
	signal w1s6 : sfixed(14 downto -8);
	signal w1s7 : sfixed(15 downto -8);
	
	signal w2s0 : sfixed(8 downto -8);
	signal w2s1 : sfixed(9 downto -8);
	signal w2s2 : sfixed(10 downto -8);
	signal w2s3 : sfixed(11 downto -8);
	signal w2s4 : sfixed(12 downto -8);
	signal w2s5 : sfixed(13 downto -8);
	signal w2s6 : sfixed(14 downto -8);
	signal w2s7 : sfixed(15 downto -8);

	signal w3s0 : sfixed(8 downto -8);
	signal w3s1 : sfixed(9 downto -8);
	signal w3s2 : sfixed(10 downto -8);
	signal w3s3 : sfixed(11 downto -8);
	signal w3s4 : sfixed(12 downto -8);
	signal w3s5 : sfixed(13 downto -8);
	signal w3s6 : sfixed(14 downto -8);
	signal w3s7 : sfixed(15 downto -8);
	
	signal w4s0 : sfixed(8 downto -8);
	signal w4s1 : sfixed(9 downto -8);
	signal w4s2 : sfixed(10 downto -8);
	signal w4s3 : sfixed(11 downto -8);
	signal w4s4 : sfixed(12 downto -8);
	signal w4s5 : sfixed(13 downto -8);
	signal w4s6 : sfixed(14 downto -8);
	signal w4s7 : sfixed(15 downto -8);

	signal w5s0 : sfixed(8 downto -8);
	signal w5s1 : sfixed(9 downto -8);
	signal w5s2 : sfixed(10 downto -8);
	signal w5s3 : sfixed(11 downto -8);
	signal w5s4 : sfixed(12 downto -8);
	signal w5s5 : sfixed(13 downto -8);
	signal w5s6 : sfixed(14 downto -8);
	signal w5s7 : sfixed(15 downto -8);
	
	signal w6s0 : sfixed(8 downto -8);
	signal w6s1 : sfixed(9 downto -8);
	signal w6s2 : sfixed(10 downto -8);
	signal w6s3 : sfixed(11 downto -8);
	signal w6s4 : sfixed(12 downto -8);
	signal w6s5 : sfixed(13 downto -8);
	signal w6s6 : sfixed(14 downto -8);
	signal w6s7 : sfixed(15 downto -8);

	signal w7s0 : sfixed(8 downto -8);
	signal w7s1 : sfixed(9 downto -8);
	signal w7s2 : sfixed(10 downto -8);
	signal w7s3 : sfixed(11 downto -8);
	signal w7s4 : sfixed(12 downto -8);
	signal w7s5 : sfixed(13 downto -8);
	signal w7s6 : sfixed(14 downto -8);
	signal w7s7 : sfixed(15 downto -8);
begin

	proc1:process(i_clk)
	begin
	-- zero (initial sum)
	w0z <= to_sfixed(0,7,-8);
	
	if (weights(0)(0) = '1') then w0s0 <= w0z + nn_in(0); else w0s0 <= w0z - nn_in(0); end if;
	if (weights(0)(1) = '1') then w0s1 <= w0s0 + nn_in(1); else w0s1 <= w0s0 - nn_in(1); end if;
	if (weights(0)(2) = '1') then w0s2 <= w0s1 + nn_in(2); else w0s2 <= w0s1 - nn_in(2); end if;
	if (weights(0)(3) = '1') then w0s3 <= w0s2 + nn_in(3); else w0s3 <= w0s2 - nn_in(3); end if;
	if (weights(0)(4) = '1') then w0s4 <= w0s3 + nn_in(4); else w0s4 <= w0s3 - nn_in(4); end if;
	if (weights(0)(5) = '1') then w0s5 <= w0s4 + nn_in(5); else w0s5 <= w0s4 - nn_in(5); end if;
	if (weights(0)(6) = '1') then w0s6 <= w0s5 + nn_in(6); else w0s6 <= w0s5 - nn_in(6); end if;
	if (weights(0)(7) = '1') then w0s7 <= w0s6 + nn_in(7); else w0s7 <= w0s6 - nn_in(7); end if;
	nn_out(0)(15 downto -8) <= w0s7;
	nn_out(0)(-8 downto -16) <= "000000000";
	
	if (weights(1)(0) = '1') then w1s0 <= w0z + nn_in(0); else w0s0 <= w0z - nn_in(0); end if;
	if (weights(1)(1) = '1') then w1s1 <= w1s0 + nn_in(1); else w1s1 <= w1s0 - nn_in(1); end if;
	if (weights(1)(2) = '1') then w1s2 <= w1s1 + nn_in(2); else w1s2 <= w1s1 - nn_in(2); end if;
	if (weights(1)(3) = '1') then w1s3 <= w1s2 + nn_in(3); else w1s3 <= w1s2 - nn_in(3); end if;
	if (weights(1)(4) = '1') then w1s4 <= w1s3 + nn_in(4); else w1s4 <= w1s3 - nn_in(4); end if;
	if (weights(1)(5) = '1') then w1s5 <= w1s4 + nn_in(5); else w1s5 <= w1s4 - nn_in(5); end if;
	if (weights(1)(6) = '1') then w1s6 <= w1s5 + nn_in(6); else w1s6 <= w1s5 - nn_in(6); end if;
	if (weights(1)(7) = '1') then w1s7 <= w1s6 + nn_in(7); else w1s7 <= w1s6 - nn_in(7); end if;
	nn_out(1)(15 downto -8) <= w1s7;
	nn_out(1)(-8 downto -16) <= "000000000";	
	
	if (weights(2)(0) = '1') then w2s0 <= w0z + nn_in(0); else w2s0 <= w0z - nn_in(0); end if;
	if (weights(2)(1) = '1') then w2s1 <= w2s0 + nn_in(1); else w2s1 <= w2s0 - nn_in(1); end if;
	if (weights(2)(2) = '1') then w2s2 <= w2s1 + nn_in(2); else w2s2 <= w2s1 - nn_in(2); end if;
	if (weights(2)(3) = '1') then w2s3 <= w2s2 + nn_in(3); else w2s3 <= w2s2 - nn_in(3); end if;
	if (weights(2)(4) = '1') then w2s4 <= w2s3 + nn_in(4); else w2s4 <= w2s3 - nn_in(4); end if;
	if (weights(2)(5) = '1') then w2s5 <= w2s4 + nn_in(5); else w2s5 <= w2s4 - nn_in(5); end if;
	if (weights(2)(6) = '1') then w2s6 <= w2s5 + nn_in(6); else w2s6 <= w2s5 - nn_in(6); end if;
	if (weights(2)(7) = '1') then w2s7 <= w2s6 + nn_in(7); else w2s7 <= w2s6 - nn_in(7); end if;
	nn_out(2)(15 downto -8) <= w2s7;
	nn_out(2)(-8 downto -16) <= "000000000";
	
	if (weights(3)(0) = '1') then w3s0 <= w0z + nn_in(0); else w3s0 <= w0z - nn_in(0); end if;
	if (weights(3)(1) = '1') then w3s1 <= w3s0 + nn_in(1); else w3s1 <= w3s0 - nn_in(1); end if;
	if (weights(3)(2) = '1') then w3s2 <= w3s1 + nn_in(2); else w3s2 <= w3s1 - nn_in(2); end if;
	if (weights(3)(3) = '1') then w3s3 <= w3s2 + nn_in(3); else w3s3 <= w3s2 - nn_in(3); end if;
	if (weights(3)(4) = '1') then w3s4 <= w3s3 + nn_in(4); else w3s4 <= w3s3 - nn_in(4); end if;
	if (weights(3)(5) = '1') then w3s5 <= w3s4 + nn_in(5); else w3s5 <= w3s4 - nn_in(5); end if;
	if (weights(3)(6) = '1') then w3s6 <= w3s5 + nn_in(6); else w3s6 <= w3s5 - nn_in(6); end if;
	if (weights(3)(7) = '1') then w3s7 <= w3s6 + nn_in(7); else w3s7 <= w3s6 - nn_in(7); end if;
	nn_out(3)(15 downto -8) <= w3s7;
	nn_out(3)(-8 downto -16) <= "000000000";	
	
	if (weights(4)(0) = '1') then w4s0 <= w0z + nn_in(0); else w4s0 <= w0z - nn_in(0); end if;
	if (weights(4)(1) = '1') then w4s1 <= w4s0 + nn_in(1); else w4s1 <= w4s0 - nn_in(1); end if;
	if (weights(4)(2) = '1') then w4s2 <= w4s1 + nn_in(2); else w4s2 <= w4s1 - nn_in(2); end if;
	if (weights(4)(3) = '1') then w4s3 <= w4s2 + nn_in(3); else w4s3 <= w4s2 - nn_in(3); end if;
	if (weights(4)(4) = '1') then w4s4 <= w4s3 + nn_in(4); else w4s4 <= w4s3 - nn_in(4); end if;
	if (weights(4)(5) = '1') then w4s5 <= w4s4 + nn_in(5); else w4s5 <= w4s4 - nn_in(5); end if;
	if (weights(4)(6) = '1') then w4s6 <= w4s5 + nn_in(6); else w4s6 <= w4s5 - nn_in(6); end if;
	if (weights(4)(7) = '1') then w4s7 <= w4s6 + nn_in(7); else w4s7 <= w4s6 - nn_in(7); end if;
	nn_out(4)(15 downto -8) <= w4s7;
	nn_out(4)(-8 downto -16) <= "000000000";
	
	if (weights(5)(0) = '1') then w5s0 <= w0z + nn_in(0); else w5s0 <= w0z - nn_in(0); end if;
	if (weights(5)(1) = '1') then w5s1 <= w5s0 + nn_in(1); else w5s1 <= w5s0 - nn_in(1); end if;
	if (weights(5)(2) = '1') then w5s2 <= w5s1 + nn_in(2); else w5s2 <= w5s1 - nn_in(2); end if;
	if (weights(5)(3) = '1') then w5s3 <= w5s2 + nn_in(3); else w5s3 <= w5s2 - nn_in(3); end if;
	if (weights(5)(4) = '1') then w5s4 <= w5s3 + nn_in(4); else w5s4 <= w5s3 - nn_in(4); end if;
	if (weights(5)(5) = '1') then w5s5 <= w5s4 + nn_in(5); else w5s5 <= w5s4 - nn_in(5); end if;
	if (weights(5)(6) = '1') then w5s6 <= w5s5 + nn_in(6); else w5s6 <= w5s5 - nn_in(6); end if;
	if (weights(5)(7) = '1') then w5s7 <= w5s6 + nn_in(7); else w5s7 <= w5s6 - nn_in(7); end if;
	nn_out(5)(15 downto -8) <= w5s7;
	nn_out(5)(-8 downto -16) <= "000000000";	
	
	if (weights(6)(0) = '1') then w6s0 <= w0z + nn_in(0); else w6s0 <= w0z - nn_in(0); end if;
	if (weights(6)(1) = '1') then w6s1 <= w6s0 + nn_in(1); else w6s1 <= w6s0 - nn_in(1); end if;
	if (weights(6)(2) = '1') then w6s2 <= w6s1 + nn_in(2); else w6s2 <= w6s1 - nn_in(2); end if;
	if (weights(6)(3) = '1') then w6s3 <= w6s2 + nn_in(3); else w6s3 <= w6s2 - nn_in(3); end if;
	if (weights(6)(4) = '1') then w6s4 <= w6s3 + nn_in(4); else w6s4 <= w6s3 - nn_in(4); end if;
	if (weights(6)(5) = '1') then w6s5 <= w6s4 + nn_in(5); else w6s5 <= w6s4 - nn_in(5); end if;
	if (weights(6)(6) = '1') then w6s6 <= w6s5 + nn_in(6); else w6s6 <= w6s5 - nn_in(6); end if;
	if (weights(6)(7) = '1') then w6s7 <= w6s6 + nn_in(7); else w6s7 <= w6s6 - nn_in(7); end if;
	nn_out(6)(15 downto -8) <= w6s7;
	nn_out(6)(-8 downto -16) <= "000000000";
	
	if (weights(7)(0) = '1') then w7s0 <= w0z + nn_in(0); else w7s0 <= w0z - nn_in(0); end if;
	if (weights(7)(1) = '1') then w7s1 <= w7s0 + nn_in(1); else w7s1 <= w7s0 - nn_in(1); end if;
	if (weights(7)(2) = '1') then w7s2 <= w7s1 + nn_in(2); else w7s2 <= w7s1 - nn_in(2); end if;
	if (weights(7)(3) = '1') then w7s3 <= w7s2 + nn_in(3); else w7s3 <= w7s2 - nn_in(3); end if;
	if (weights(7)(4) = '1') then w7s4 <= w7s3 + nn_in(4); else w7s4 <= w7s3 - nn_in(4); end if;
	if (weights(7)(5) = '1') then w7s5 <= w7s4 + nn_in(5); else w7s5 <= w7s4 - nn_in(5); end if;
	if (weights(7)(6) = '1') then w7s6 <= w7s5 + nn_in(6); else w7s6 <= w7s5 - nn_in(6); end if;
	if (weights(7)(7) = '1') then w7s7 <= w7s6 + nn_in(7); else w7s7 <= w7s6 - nn_in(7); end if;
	nn_out(7)(15 downto -8) <= w7s7;
	nn_out(7)(-8 downto -16) <= "000000000";

   end process;

end Behavioral;