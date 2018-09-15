library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Popcount_4 is
    Port ( input_vector : in  STD_LOGIC_VECTOR(3 downto 0);
           count : out  STD_LOGIC_VECTOR(7 downto 0)
			  );
end Popcount_4;

architecture Behavioral of Popcount_4 is

begin
  process (input_vector)
  begin
  -- 2s comp notation for 8 bits
  -- -4 = "FC"
  -- -2 = "FE"
  -- 0 = x"00"
  -- +2 = x"02"
  -- +4 = x"04"
  
	 case input_vector is
	    when x"0"  => count <= x"FC";
	 	 when x"1" | x"2" | x"4" | x"8" => count <= x"FE";
		 when x"3" | x"5" | x"6" | x"9" | x"A" | x"C" => count <= x"00";
		 when x"7" | x"B" | x"D" | x"E" => count <= x"02";
		 when x"F"  => count <= x"04";
		 when others => count <= x"00";
	 end case;
  end process;
end Behavioral;