library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Popcount_8 is
    Port ( input_vector : in  STD_LOGIC_VECTOR(31 downto 0);
           count : out  STD_LOGIC_VECTOR(7 downto 0)
			  );
end Popcount_8;

architecture Behavioral of Popcount_8 is

component Popcount_4
   port ( input_vector : in  STD_LOGIC_VECTOR(3 downto 0);
           count : out  STD_LOGIC_VECTOR(7 downto 0)
			  );
	end component;

component Ripple_Carry_Adder 
    Port ( SUB: in STD_LOGIC; -- '0' = add, '1' = sub 
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           COUT : out  STD_LOGIC;
			  V : out STD_LOGIC
			  );
	end component;

  signal count1 : std_logic_vector(7 downto 0) := x"00";
  signal count0 : std_logic_vector(7 downto 0) := x"00";
  
begin
  pop1: Popcount_4 PORT MAP (input_vector => input_vector(23 downto 20), count => count1);
  pop0: Popcount_4 PORT MAP (input_vector => input_vector(19 downto 16), count => count0);
  add_0_0: Ripple_Carry_Adder PORT MAP (SUB => '0', A => count1, B => count0, S => count); 
  
end Behavioral;
