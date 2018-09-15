library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_popcount_4 is
end tb_popcount_4;
architecture Behavioral of tb_popcount_4 is

component Popcount_4
   port ( input_vector : in  STD_LOGIC_VECTOR(3 downto 0);
           count : out  STD_LOGIC_VECTOR(2 downto 0)
			  );
	end component;
	
	--Inputs
   signal CLK : std_logic := '0';
	signal input_vector : STD_LOGIC_VECTOR(3 downto 0);

   --Outputs
	signal count : STD_LOGIC_VECTOR(2 downto 0);
	
	--Testbench Related
   constant period : time := 10 ns;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Popcount_4 PORT MAP (
          input_vector => input_vector,
			 count => count
        );

   -- Clock process definitions
   process1 :process
   variable i : integer := 0;
	begin
	   input_vector <= "0000";
		for i in 0 to 15 loop
		  wait for period;
		    input_vector <= std_logic_vector(unsigned(input_vector) + 1);
		end loop;
		
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      wait for period/2;
      CLK <= not CLK;
   end process;

end Behavioral;

