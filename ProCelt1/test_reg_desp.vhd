--------------------------------------------------------------------------------
-- Test Bench para registro de desplazamiento de 14 bits
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY test_reg_desp IS
END test_reg_desp;
 
ARCHITECTURE behavior OF test_reg_desp IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_desp
    PORT(
         SIN : IN  std_logic;
         CLK : IN  std_logic;
         EN : IN  std_logic;
         Q : OUT  std_logic_vector(13 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SIN : std_logic := '0';
   signal CLK : std_logic := '0';
   signal EN : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(13 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_desp PORT MAP (
          SIN => SIN,
          CLK => CLK,
          EN => EN,
          Q => Q
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- El periodo de reloj es de 10 ns
      wait for 10 ns;	
		--Desactivamos el ENABLE y cargamos 3 '0' y 11 '1' en sincronía con el reloj
		EN<='0';
      SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		
		--Ahora activamos el ENABLE y cargamos 3 '0' y 11 '1' en sincronía con el reloj
		EN<='1';
      SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		wait;
   end process;

END;
