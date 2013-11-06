--------------------------------------------------------------------------------
-- Test Bench para comparador
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_comparador IS
END test_comparador;
 
ARCHITECTURE behavior OF test_comparador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comparador
    PORT(
         P : IN  std_logic_vector(5 downto 0);
         Q : IN  std_logic_vector(5 downto 0);
         PGTQ : OUT  std_logic;
         PLEQ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal P : std_logic_vector(5 downto 0) := (others => '0');
   signal Q : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal PGTQ : std_logic;
   signal PLEQ : std_logic;
	
   -- No necesita señal de reloj al tratarse de un circuito combinacional 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparador PORT MAP (
          P => P,
          Q => Q,
          PGTQ => PGTQ,
          PLEQ => PLEQ
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 5 ns;	
		Q<="010100";  -- valor de Q=20 decimal
						  -- Probar con otros valores
		
		-- P va tomado todos los valores desde 000000 hasta 111111
		P<="000000"; wait for 10 ns;
		P<="000001"; wait for 10 ns;
		P<="000010"; wait for 10 ns;
		P<="000011"; wait for 10 ns;
		P<="000100"; wait for 10 ns;
		P<="000101"; wait for 10 ns;
		P<="000110"; wait for 10 ns;
		P<="000111"; wait for 10 ns;
		P<="001000"; wait for 10 ns;
		P<="001001"; wait for 10 ns;
		P<="001010"; wait for 10 ns;
		P<="001011"; wait for 10 ns;
		P<="001100"; wait for 10 ns;
		P<="001101"; wait for 10 ns;
		P<="001110"; wait for 10 ns;
		P<="001111"; wait for 10 ns;
		P<="010000"; wait for 10 ns;
		P<="010001"; wait for 10 ns;
		P<="010010"; wait for 10 ns;
		P<="010011"; wait for 10 ns;
		P<="010100"; wait for 10 ns;
		P<="010101"; wait for 10 ns;
		P<="010110"; wait for 10 ns;
		P<="010111"; wait for 10 ns;
		P<="011000"; wait for 10 ns;
		P<="011001"; wait for 10 ns;
		P<="011010"; wait for 10 ns;
		P<="011011"; wait for 10 ns;
		P<="011100"; wait for 10 ns;
		P<="011101"; wait for 10 ns;
		P<="011110"; wait for 10 ns;
		P<="011111"; wait for 10 ns;
		P<="100000"; wait for 10 ns;
		P<="100001"; wait for 10 ns;
		P<="100010"; wait for 10 ns;
		P<="100011"; wait for 10 ns;
		P<="100100"; wait for 10 ns;
		P<="100101"; wait for 10 ns;
		P<="100110"; wait for 10 ns;
		P<="100111"; wait for 10 ns;
		P<="101000"; wait for 10 ns;
		P<="101001"; wait for 10 ns;
		P<="101010"; wait for 10 ns;
		P<="101011"; wait for 10 ns;
		P<="101100"; wait for 10 ns;
		P<="101101"; wait for 10 ns;
		P<="101110"; wait for 10 ns;
		P<="101111"; wait for 10 ns;
		P<="110000"; wait for 10 ns;
		P<="110001"; wait for 10 ns;
		P<="110010"; wait for 10 ns;
		P<="110011"; wait for 10 ns;
		P<="110100"; wait for 10 ns;
		P<="110101"; wait for 10 ns;
		P<="110110"; wait for 10 ns;
		P<="110111"; wait for 10 ns;
		P<="111000"; wait for 10 ns;
		P<="111001"; wait for 10 ns;
		P<="111010"; wait for 10 ns;
		P<="111011"; wait for 10 ns;
		P<="111100"; wait for 10 ns;
		P<="111101"; wait for 10 ns;
		P<="111110"; wait for 10 ns;
		P<="111111"; wait for 10 ns;

      wait;
   end process;

END;
