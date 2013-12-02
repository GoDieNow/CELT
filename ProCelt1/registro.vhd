----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable GavilÃ¡n
--				  Diego MartÃ­n Borreguero
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
			ENTRADA : in STD_LOGIC_VECTOR (14 downto 0);	 						-- Entrada al registo (15 bits) 
			SALIDA  : out STD_LOGIC_VECTOR (14 downto 0); 						-- Salida del registro (15 bits)
			CLK 	  : in STD_LOGIC); 													-- Reloj 
end registro;

architecture Behavioral of registro is
	
	---------------------------
	-- Declaracion de señales
	---------------------------
	
	signal SAUX : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";	-- Señal auziliar de 15 bits para evitar 'UU'

begin
	process (CLK)
		begin
			if CLK'event and CLK='1' then												-- Condicion de activacion de CLK a nivel alto
				SAUX <= ENTRADA;															-- Metemos entrada en la señal auxiliar de salida
			end if;
	end process;
	
	SALIDA <= SAUX;																		-- Metemos la señal auxiliar a la salida

end Behavioral;

