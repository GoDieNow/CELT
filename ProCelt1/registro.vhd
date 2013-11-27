----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    Registro
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity registro is
		port (
			ENTRADA : in STD_LOGIC_VECTOR (14 downto 0);	 -- Entradas 
			SALIDA  : out STD_LOGIC_VECTOR (14 downto 0); -- Salidas 
			CLK 	  : in STD_LOGIC); -- Reloj 
end registro;

architecture Behavioral of registro is
	
	signal SAUX : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";

begin
	process (CLK)
		begin
			if CLK'event and CLK='1' then
				SAUX <= ENTRADA;
			end if;
	end process;
	
	SALIDA <= SAUX;

end Behavioral;

