library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_Latch is
    Port ( C : in  STD_LOGIC;
			  S : in  STD_LOGIC;
           R : in  STD_LOGIC;
           Q1 : out  STD_LOGIC;
           Q2 : out  STD_LOGIC);
end SR_Latch;

architecture Behavioral of SR_Latch is

signal s_bar : std_logic;
signal r_bar : std_logic;
signal Q1_sig : std_logic;
signal Q2_sig : std_logic;

begin
	s_bar <= not (S and C); 
	r_bar <= not (R and C); 
	q1_sig <= not (s_bar and q2_sig);
	q2_sig <= not (r_bar and q1_sig);
	Q1 <= q1_sig;
	Q2 <= q2_sig;
end Behavioral;
