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

entity xnor_popcount_32 is
    Port ( weights : in  matrix_bin_type;
			  nn_in : in std_logic_vector(7 downto 0);
           nn_out : out vector_fixed_point_type
			  );
end xnor_popcount_32;

architecture Behavioral of xnor_popcount_32 is

component Popcount_32
   port ( input_vector : in  STD_LOGIC_VECTOR(31 downto 0);
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

   -- this is where we store xnor results
	signal xnor_0,xnor_1,xnor_2,xnor_3,xnor_4,xnor_5,xnor_6,xnor_7 : std_logic_vector(7 downto 0);
  
   -- this is where we store pop results
	signal pop_0,pop_1,pop_2,pop_3,pop_4,pop_5,pop_6,pop_7 : std_logic_vector(7 downto 0);
  
  
  	-- this is where we store double_pop_ = 2*Pcount results
	signal double_pop_0,double_pop_1,double_pop_2,double_pop_3,double_pop_4,double_pop_5,double_pop_6,double_pop_7 : std_logic_vector(7 downto 0);
  
   -- 8 bits total
   signal num_bits : std_logic_vector(7 downto 0) := "00001000";
  
  	-- this is where we store val= double_pop_ - 8 results
	signal val_0,val_1,val_2,val_3,val_4,val_5,val_6,val_7 : std_logic_vector(7 downto 0);
   
	
	
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
	pop0: Popcount_32 PORT MAP (input_vector => xnor_0 & x"000000" , count => pop_0);
   pop1: Popcount_32 PORT MAP (input_vector => xnor_1 & x"000000" , count => pop_1);
	pop2: Popcount_32 PORT MAP (input_vector => xnor_2 & x"000000", count => pop_2);
	pop3: Popcount_32 PORT MAP (input_vector => xnor_3 & x"000000", count => pop_3);
	pop4: Popcount_32 PORT MAP (input_vector => xnor_4 & x"000000", count => pop_4);
	pop5: Popcount_32 PORT MAP (input_vector => xnor_5 & x"000000", count => pop_5);
	pop6: Popcount_32 PORT MAP (input_vector => xnor_6 & x"000000", count => pop_6);
	pop7: Popcount_32 PORT MAP (input_vector => xnor_7 & x"000000", count => pop_7);
	

	-- have to do: 2 * Pop count - Number of Bits
	
	
  double_0: Ripple_Carry_Adder PORT MAP (SUB => '0', A => pop_0, B => pop_0, S => double_pop_0);
  minus_numbits_0: Ripple_Carry_Adder PORT MAP (SUB => '1', A => double_pop_0, B => num_bits, S => val_0);

  double_1: Ripple_Carry_Adder PORT MAP (SUB => '0', A => pop_1, B => pop_1, S => double_pop_1);
  minus_numbits_1: Ripple_Carry_Adder PORT MAP (SUB => '1', A => double_pop_1, B => num_bits, S => val_1);

  double_2: Ripple_Carry_Adder PORT MAP (SUB => '0', A => pop_2, B => pop_2, S => double_pop_2);
  minus_numbits_2: Ripple_Carry_Adder PORT MAP (SUB => '1', A => double_pop_2, B => num_bits, S => val_2);

  double_3: Ripple_Carry_Adder PORT MAP (SUB => '0', A => pop_3, B => pop_3, S => double_pop_3);
  minus_numbits_3: Ripple_Carry_Adder PORT MAP (SUB => '1', A => double_pop_3, B => num_bits, S => val_3);

  double_4: Ripple_Carry_Adder PORT MAP (SUB => '0', A => pop_4, B => pop_4, S => double_pop_4);
  minus_numbits_4: Ripple_Carry_Adder PORT MAP (SUB => '1', A => double_pop_4, B => num_bits, S => val_4);

  double_5: Ripple_Carry_Adder PORT MAP (SUB => '0', A => pop_5, B => pop_5, S => double_pop_5);
  minus_numbits_5: Ripple_Carry_Adder PORT MAP (SUB => '1', A => double_pop_5, B => num_bits, S => val_5);

  double_6: Ripple_Carry_Adder PORT MAP (SUB => '0', A => pop_6, B => pop_6, S => double_pop_6);
  minus_numbits_6: Ripple_Carry_Adder PORT MAP (SUB => '1', A => double_pop_6, B => num_bits, S => val_6);

  double_7: Ripple_Carry_Adder PORT MAP (SUB => '0', A => pop_7, B => pop_7, S => double_pop_7);
  minus_numbits_7: Ripple_Carry_Adder PORT MAP (SUB => '1', A => double_pop_7, B => num_bits, S => val_7);
	
	--nn_out(0)(23 downto 16) <= temp_0;
	nn_out(0)(23 downto 16) <= val_0;
	nn_out(1)(23 downto 16) <= val_1;
	nn_out(2)(23 downto 16) <= val_2;
	nn_out(3)(23 downto 16) <= val_3;
	nn_out(4)(23 downto 16) <= val_4;
	nn_out(5)(23 downto 16) <= val_5;
	nn_out(6)(23 downto 16) <= val_6;
	nn_out(7)(23 downto 16) <= val_7;
	
end Behavioral;
