library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Popcount_32 is
    Port ( input_vector : in  STD_LOGIC_VECTOR(31 downto 0);
           count : out  STD_LOGIC_VECTOR(7 downto 0)
			  );
end Popcount_32;

architecture Behavioral of Popcount_32 is

component Popcount_4_old
   port ( input_vector : in  STD_LOGIC_VECTOR(3 downto 0);
           count : out  STD_LOGIC_VECTOR(2 downto 0)
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

  signal count7 : std_logic_vector(7 downto 0) := x"00";
  signal count6 : std_logic_vector(7 downto 0) := x"00";
  signal count5 : std_logic_vector(7 downto 0) := x"00";
  signal count4 : std_logic_vector(7 downto 0) := x"00";
  signal count3 : std_logic_vector(7 downto 0) := x"00";
  signal count2 : std_logic_vector(7 downto 0) := x"00";
  signal count1 : std_logic_vector(7 downto 0) := x"00";
  signal count0 : std_logic_vector(7 downto 0) := x"00";
  signal sum_0_3 : std_logic_vector(7 downto 0) := x"00";
  signal sum_0_2 : std_logic_vector(7 downto 0) := x"00";
  signal sum_0_1 : std_logic_vector(7 downto 0) := x"00";
  signal sum_0_0 : std_logic_vector(7 downto 0) := x"00";
  signal sum_1_1 : std_logic_vector(7 downto 0) := x"00";
  signal sum_1_0 : std_logic_vector(7 downto 0) := x"00";
  --signal sum_2 : std_logic_vector(7 downto 0) := x"00";
  
begin
  pop7: Popcount_4_old PORT MAP (input_vector => input_vector(31 downto 28), count => count7(2 downto 0));
  pop6: Popcount_4_old PORT MAP (input_vector => input_vector(27 downto 24), count => count6(2 downto 0));
  pop5: Popcount_4_old PORT MAP (input_vector => input_vector(23 downto 20), count => count5(2 downto 0));
  pop4: Popcount_4_old PORT MAP (input_vector => input_vector(19 downto 16), count => count4(2 downto 0));
  pop3: Popcount_4_old PORT MAP (input_vector => input_vector(15 downto 12), count => count3(2 downto 0));
  pop2: Popcount_4_old PORT MAP (input_vector => input_vector(11 downto 8), count => count2(2 downto 0));
  pop1: Popcount_4_old PORT MAP (input_vector => input_vector(7 downto 4), count => count1(2 downto 0));
  pop0: Popcount_4_old PORT MAP (input_vector => input_vector(3 downto 0), count => count0(2 downto 0));
  add_0_3: Ripple_Carry_Adder PORT MAP (SUB => '0', A => count7, B => count6, S => sum_0_3(7 downto 0));
  add_0_2: Ripple_Carry_Adder PORT MAP (SUB => '0', A => count5, B => count4, S => sum_0_2(7 downto 0));
  add_0_1: Ripple_Carry_Adder PORT MAP (SUB => '0', A => count3, B => count2, S => sum_0_1(7 downto 0));
  add_0_0: Ripple_Carry_Adder PORT MAP (SUB => '0', A => count1, B => count0, S => sum_0_0(7 downto 0));
  add_1_1: Ripple_Carry_Adder PORT MAP (SUB => '0', A => sum_0_3, B => sum_0_2, S => sum_1_1(7 downto 0));
  add_1_0: Ripple_Carry_Adder PORT MAP (SUB => '0', A => sum_0_1, B => sum_0_0, S => sum_1_0(7 downto 0));
  add_2: Ripple_Carry_Adder PORT MAP (SUB => '0', A => sum_1_1, B => sum_1_0, S => count);
  --count <= sum_2(6 downto 0);  
  
end Behavioral;
