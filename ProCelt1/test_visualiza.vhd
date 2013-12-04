--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:29:23 11/27/2013
-- Design Name:   
-- Module Name:   C:/alumnos/ProCelt1/test_visualiza.vhd
-- Project Name:  ProCelt1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: visualizacion
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_visualiza IS
END test_visualiza;
 
ARCHITECTURE behavior OF test_visualiza IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT visualizacion
    PORT(
         E0 : IN  std_logic_vector(3 downto 0);
         E1 : IN  std_logic_vector(3 downto 0);
         E2 : IN  std_logic_vector(3 downto 0);
         E3 : IN  std_logic_vector(3 downto 0);
         CLK : IN  std_logic;
         SEG7 : OUT  std_logic_vector(0 to 6);
         AN : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal E0 : std_logic_vector(3 downto 0) := (others => '0');
   signal E1 : std_logic_vector(3 downto 0) := (others => '0');
   signal E2 : std_logic_vector(3 downto 0) := (others => '0');
   signal E3 : std_logic_vector(3 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal SEG7 : std_logic_vector(0 to 6);
   signal AN : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: visualizacion PORT MAP (
          E0 => E0,
          E1 => E1,
          E2 => E2,
          E3 => E3,
          CLK => CLK,
          SEG7 => SEG7,
          AN => AN
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
      -- hold reset state for 100 ns.
      wait for 5 ns;	--19:30
		E0 <= "0001";
		E1 <= "1001";
		E2 <= "0011";
		E3 <= "0000";
		
		wait for 1000 ns;	--21:45
		E0 <= "0010";
		E1 <= "0001";
		E2 <= "0100";
		E3 <= "0101";
		
		wait for 1000 ns;	--37:29
		E0 <= "0011";
		E1 <= "0111";
		E2 <= "0010";
		E3 <= "1001";
		
		wait for 1000 ns;	--44:44
		E0 <= "0100";
		E1 <= "0100";
		E2 <= "0100";
		E3 <= "0100";
		
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
