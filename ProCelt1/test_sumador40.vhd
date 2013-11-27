--------------------------------------------------------------------------------
-- Test Bench para sumador de 40 bits de entrada
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_sumador40 IS
END test_sumador40;
 
ARCHITECTURE behavior OF test_sumador40 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumador40
    PORT(
         ENT : IN  std_logic_vector(39 downto 0);
         SAL : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ENT : std_logic_vector(39 downto 0) := (others => '0');
	
 	--Outputs
   signal SAL : std_logic_vector(5 downto 0);
	
	-- No necesita señal de reloj al tratarse de un circuito combinacional 
	
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador40 PORT MAP (
          ENT => ENT,
          SAL => SAL
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- Probamos diferentes valores en las entradas. 
		-- Sería imposible probar todos los valores
		-- Puede cambiar y probar otros valores
		
      wait for 10 ns;	
      ENT<="0000000000000000000000000000000000000000";
      wait for 10 ns;
		ENT<="0000000000000000000011111111111111111111";
      wait for 10 ns;
		ENT<="1111111111111111111100000000000000000000";
      wait for 10 ns;
		ENT<="1010101010101010101010101010101010101010";
      wait for 10 ns;
      ENT<="0101010101010101010101010101010101010101";
      wait for 10 ns;
		ENT<="1111111111111111111111111111111111111111";
      wait for 10 ns;
		
      wait;
   end process;

END;
