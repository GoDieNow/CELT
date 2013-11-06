--------------------------------------------------------------------------------
-- Test Bench para simulación de autómata
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_automata IS
END test_automata;
 
ARCHITECTURE behavior OF test_automata IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT automata
    PORT(
         CLK : IN  std_logic;
         C0 : IN  std_logic;
         C1 : IN  std_logic;
         DATO : OUT  std_logic;
         CAPTUR : OUT  std_logic;
         VALID : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal C0 : std_logic := '0';
   signal C1 : std_logic := '0';

 	--Outputs
   signal DATO : std_logic;
   signal CAPTUR : std_logic;
   signal VALID : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: automata PORT MAP (
          CLK => CLK,
          C0 => C0,
          C1 => C1,
          DATO => DATO,
          CAPTUR => CAPTUR,
          VALID => VALID
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
      -- Periodo del reloj = 10 ns.
      wait for 5 ns;
		
		-- Comenzamos en el estado inicial ESP_SYNC
		
		C0<='0';         -- Llegada de un 1
		C1<='1';
      wait for 30 ns;  -- Durante 3 ciclos de reloj
							  -- El autómata debe quedarse en ESP_SYNC

		C0<='0';         -- Llegada de un SYNC
		C1<='0';         
      wait for 400 ns; -- Durante 40 ciclos
							  -- El autómata debe pasar al estado
							  -- AVAN_ZM y permanecer durante 20 ciclos.
							  -- Luego debe pasar al estado MUESTREO	
		
		C0<='1';         -- Llegada de un 0
		C1<='0';
      wait for 400 ns; -- Durante 40 ciclos
							  -- El autómata debe pasar al estado DATO0
							  -- y volver a MUESTREO

		C0<='0';         -- Llegada de un 1 
		C1<='1';
      wait for 400 ns; -- Durante 40 ciclos
							  -- El autómata debe pasar al estado DATO1
							  -- y volver a MUESTREO

      C0<='0';         -- Llegada de un SYNC
		C1<='0';
      wait for 400 ns; -- Durante 40 ciclos
							  -- El autómata debe pasar al estado DATOSYNC
							  -- y volver a MUESTREO

      wait;
   end process;

END;
