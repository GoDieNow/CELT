----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable GavilÃ¡n
--				  Diego MartÃ­n Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    Registro de Desplazamiento
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

entity reg_desp is
	port (
			SIN : in STD_LOGIC; 															-- Datos de entrada serie 
			CLK : in STD_LOGIC; 															-- Reloj 
			EN  : in STD_LOGIC; 															-- Enable de activacion del modulo
			Q 	 : out STD_LOGIC_VECTOR (14 downto 0)); 							-- Salida paralelo 
end reg_desp;

architecture Behavioral of reg_desp is

	-----------------------------
	-- Declaracion de señales
	-----------------------------
	
	signal QAUX : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";	-- Señal auxiliar de 15 bits

begin

	process(CLK)
		begin
			if CLK'event and CLK = '1' then											-- Si hay un cambio en CLK y se activa a nivel alto
				if EN = '1' then															-- y el Enable esta a uno
					QAUX <= QAUX (13 downto 0) & SIN;								-- Añadimos el bit de la entrada a la señal auxiliar
				end if;
			end if;
	end process;	

	Q <= QAUX;																				-- Ponemos la señal auxiliar a la sdalida del modulo


end Behavioral;

