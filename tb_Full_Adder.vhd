----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:27:32 02/07/2018 
-- Design Name: 
-- Module Name:    tb_Full_Adder - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity tb_Ripple_Carry_Adder is
end tb_Ripple_Carry_Adder;

architecture Behavioral of tb_Ripple_Carry_Adder is
	component Ripple_Carry_Adder
	port(
		SUB : IN std_logic;
		A : IN std_logic_vector(7 downto 0);
		B : IN std_logic_vector(7 downto 0);
		COUT : OUT std_logic;
		S : OUT std_logic_vector(7 downto 0);
		V : OUT std_logic
		);
	end component;
	
	--Inputs
   signal SUB : std_logic := '0';
	signal A : std_logic_vector(7 downto 0) := "00000000";
   signal B : std_logic_vector(7 downto 0) := "00000000";
	signal CIN : std_logic := '0';

   --Outputs
   signal S : std_logic_vector(7 downto 0);
	signal COUT : std_logic;
	signal V : std_logic;
	
	--Testbench Related
   constant period : time := 10 ns;
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ripple_Carry_Adder PORT MAP (
          SUB => SUB,
			 A => A,
          B => B,
			 S => S,
          COUT => COUT,
			 V => V
        );

   -- Clock process definitions
   process1 :process
   begin
		-- Addition test:CIN=0
		SUB <= '0';
		A <= "00010000";
		B <= "01000000";
		wait for period;
		-- Addition test:Intermediate Carry
		A <= "00000111";
		B <= "00000011";
		wait for period;
		-- Addition test:Intermediate Carry with Carry IN
		A <= "00000111";
		B <= "00000011";
		wait for period;
		-- Addition test:Intermediate Carry with Carry IN with overflow
		A <= "11100111";
		B <= "11100011";
		wait for period;
		-- Subtraction test:CIN=0
		SUB <= '1';
		A <= "00010000";
		B <= "01000000";
		wait for period;
		-- Subtraction test:Intermediate Carry
		A <= "00000111";
		B <= "00000011";
		wait for period;
		-- Subtraction test:Intermediate Carry with Carry IN
		A <= "00000111";
		B <= "00000011";
		wait for period;
		-- Subtraction test:Intermediate Carry with Carry IN with overflow
		A <= "10000111";
		B <= "10000011";
		wait for period;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

