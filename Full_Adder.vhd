----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:21:43 02/07/2018 
-- Design Name: 
-- Module Name:    Full_Adder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_Adder is
    Port ( CIN : in  STD_LOGIC;
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Z : out  STD_LOGIC;
           COUT : out  STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is

begin
	Z <= (not A and not B and CIN) 
		or (not A and B and not CIN) 
		or (A and not B and not CIN) 
		or (A and B and CIN);
	COUT <= (not A and B and CIN) 
		or (A and not B and CIN) 
		or (A and B and not CIN) 
		or (A and B and CIN);

end Behavioral;

