library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ripple_Carry_Adder is
    Port ( SUB: in STD_LOGIC; -- '0' = add, '1' = sub 
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           COUT : out  STD_LOGIC;
			  V : out STD_LOGIC
			  );
end Ripple_Carry_Adder;

architecture Behavioral of Ripple_Carry_Adder is

	component Full_Adder
	port(
		A : IN std_logic;
		B : IN std_logic;
		CIN : IN std_logic;
		COUT : OUT std_logic;
		Z : OUT std_logic
		);
	end component;

   signal C : std_logic_vector (8 downto 0):= "000000000"; -- intermediate carry out
	signal B_PRIME :   STD_LOGIC_VECTOR (7 downto 0); -- B XOR SUB
	
begin
	C(0) <= '0' XOR SUB;
	B_PRIME(7) <= B(7) XOR SUB;
	B_PRIME(6) <= B(6) XOR SUB;
	B_PRIME(5) <= B(5) XOR SUB;
	B_PRIME(4) <= B(4) XOR SUB;
	B_PRIME(3) <= B(3) XOR SUB;
	B_PRIME(2) <= B(2) XOR SUB;
	B_PRIME(1) <= B(1) XOR SUB;
	B_PRIME(0) <= B(0) XOR SUB;
   U0: Full_Adder PORT MAP (
          A => A(0),
          B => B_PRIME(0),
          CIN => C(0),
			 Z => S(0),
          COUT => C(1)
        );
		  
   U1: Full_Adder PORT MAP (
          A => A(1),
          B => B_PRIME(1),
          CIN => C(1),
			 Z => S(1),
          COUT => C(2)
        );		  

   U2: Full_Adder PORT MAP (
          A => A(2),
          B => B_PRIME(2),
          CIN => C(2),
			 Z => S(2),
          COUT => C(3)
        );		

   U3: Full_Adder PORT MAP (
          A => A(3),
          B => B_PRIME(3),
          CIN => C(3),
			 Z => S(3),
          COUT => C(4)
        );				  

   U4: Full_Adder PORT MAP (
          A => A(4),
          B => B_PRIME(4),
          CIN => C(4),
			 Z => S(4),
          COUT => C(5)
        );		

   U5: Full_Adder PORT MAP (
          A => A(5),
          B => B_PRIME(5),
          CIN => C(5),
			 Z => S(5),
          COUT => C(6)
        );	

   U6: Full_Adder PORT MAP (
          A => A(6),
          B => B_PRIME(6),
          CIN => C(6),
			 Z => S(6),
          COUT => C(7)
        );		

   U7: Full_Adder PORT MAP (
          A => A(7),
          B => B_PRIME(7),
          CIN => C(7),
			 Z => S(7),
          COUT => C(8)
        );	
	COUT <= C(8) XOR SUB;
	V <= C(7) XOR SUB;
	
end Behavioral;

