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

entity reg_desp40 is
	port ( 
			SIN : in STD_LOGIC; 									-- Datos de entrada en serie 
			CLK : in STD_LOGIC; 									-- Reloj del sistema
			Q	 : out STD_LOGIC_VECTOR (39 downto 0)); 	-- Salida paralelo 
end reg_desp40;

architecture Behavioral of reg_desp40 is

	-----------------------------
	-- Declaracion de señales
	-----------------------------
	
	signal QAUX : STD_LOGIC_VECTOR (39 downto 0) := "0000000000000000000000000000000000000000"; -- Señal auxiliar de 40 bits inicializada a 0

begin

	process(CLK)
		begin
			if CLK'event and CLK = '1' then					-- Ponemos de condición cambio en CLK a nivel alto
				QAUX <= SIN & QAUX (39 downto 1);			-- Concatenamos a la señal de entada la autiliar
			end if;
	end process;	

	Q <= QAUX;														-- Sacamos la señal obtenida del módulo

end Behavioral;

