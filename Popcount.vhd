library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Popcount_4_old is
    Port ( input_vector : in  STD_LOGIC_VECTOR(3 downto 0);
           count : out  STD_LOGIC_VECTOR(2 downto 0)
			  );
end Popcount_4_old;

architecture Behavioral of Popcount_4_old is

--signal d_bar : std_logic;

begin
  process (input_vector)
  begin
	 case input_vector is
	    when x"1" | x"2" | x"4" | x"8" => count <= "001";
	 	 when x"3" | x"5" | x"6" | x"9" | x"A" | x"C" => count <= "010";
		 when x"7" | x"B" | x"D" | x"E" => count <= "011";
		 when x"F" => count <= "100";
		 when others => count <= "000";
	 end case;
  end process;
end Behavioral;
