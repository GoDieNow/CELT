--------------------------------------------------------------------------------
-- Test Bench para simulación de registro de captura de datos
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY test_registro IS
END test_registro;
 
ARCHITECTURE behavior OF test_registro IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registro
    PORT(
         ENTRADA : IN  std_logic_vector(13 downto 0);
         SALIDA : OUT  std_logic_vector(13 downto 0);
         RCLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ENTRADA : std_logic_vector(13 downto 0) := (others => '0');
   signal RCLK : std_logic := '0';

 	--Outputs
   signal SALIDA : std_logic_vector(13 downto 0);

   -- Clock period definitions
   constant RCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registro PORT MAP (
          ENTRADA => ENTRADA,
          SALIDA => SALIDA,
          RCLK => RCLK
        );

   -- Clock process definitions
   RCLK_process :process
   begin
		RCLK <= '0';
		wait for RCLK_period/2;
		RCLK <= '1';
		wait for RCLK_period/2;
   end process;
 

   -- El periodo de reloj es de 10 ns

   -- Stimulus process
   stim_proc: process
   begin		
      -- Probamos diferentes valores de las entradas.
		-- Dichos valores solamente deben ser capturados con el flanco positivo del reloj.
		-- En otro caso, la salida debe permanecer en el ultimo valor capturado
		
      wait for 10 ns;	
      ENTRADA<="01010101010101";
      wait for 2 ns;
		ENTRADA<="10101010101010";
      wait for 2 ns;
		ENTRADA<="01010101010101";
      wait for 2 ns;
		ENTRADA<="10101010101010";
      wait for 2 ns;
		ENTRADA<="01010101010101";
      wait for 2 ns;
		ENTRADA<="10101010101010";
      wait for 2 ns;
		ENTRADA<="01010101010101";
      wait for 2 ns;
		ENTRADA<="10101010101010";
      wait for 2 ns;
		ENTRADA<="01010101010101";
      wait for 2 ns;
		ENTRADA<="10101010101010";
      wait for 2 ns;
		
      wait;
   end process;

END;
