----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    AND_2 
-- Project Name: 	 CELT 2013-14
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

entity AND_2 is
		port (
			A : in STD_LOGIC;	  -- Entrada A 
			B : in STD_LOGIC;   -- Entrada B 
			S : out STD_LOGIC); -- Salida
end AND_2;

architecture Behavioral of AND_2 is

begin

	process (A,B)
		begin
			S <= A AND B;
	end process;

end Behavioral;

