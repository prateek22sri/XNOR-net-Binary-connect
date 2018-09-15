library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_SR_Latch is
end tb_SR_Latch;

architecture Behavioral of tb_SR_Latch is

component SR_Latch
	port(
		C : IN std_logic;
		S : IN std_logic;
		R : IN std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic
		);
	end component;
	
	--Inputs
   signal S : std_logic := '0';
	signal R : std_logic := '0';
	signal C : std_logic := '0';

   --Outputs
	signal Q1 : std_logic;
	signal Q2 : std_logic;
	
	--Testbench Related
   constant period : time := 10 ns;
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SR_Latch PORT MAP (
          C => C,
			 S => S,
			 R => R,
          Q1 => Q1,
			 Q2 => Q2
        );

   -- Clock process definitions
   process1 :process
   begin
		-- Initial State
		C <= '1';
		S <= '0';
		R <= '1';
		wait for period;
		-- "Set"
		S <= '1';
		R <= '0';
		wait for period;
		-- "Reset"
		S <= '0';
		R <= '1';
		wait for period;
		-- "C=0"
		C <= '0';
		S <= '0';
		R <= '1';
		wait for period;
		-- "Set"
		S <= '1';
		R <= '0';
		wait for period;
		-- "Reset"
		S <= '0';
		R <= '1';
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

end Behavioral;

