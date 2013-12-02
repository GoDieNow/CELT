----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable GavilÃ¡n
--				  Diego MartÃ­n Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    Generador de Reloj
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

entity gen_reloj is

	-----------------------------
	-- Declaracion de constantes
	-----------------------------
	
	generic (
		R_SISTEMA 	: integer := 50000000;					-- Reloj del sistema 50 Mhz
      R_REFRESCO 	: integer := 2*1000;						-- Reloj de refresco 2*1 Khz
		R_MUESTREO 	: integer := 2*40							-- Reloj de muestreo 2*40 Hz
		);
	
	port ( 
			CLK   : in STD_LOGIC; 								-- Reloj de la FPGA
			CLK_M : out STD_LOGIC;								-- Reloj de muestreo
			CLK_V : out STD_LOGIC );  							-- Reloj de refresco de displays
end gen_reloj;

architecture Behavioral of gen_reloj is
	
	-----------------------------
	-- Declaracion de señales
	-----------------------------
	
	signal cont_M : integer := 0; 							-- Contador 1, inicializamos a 0
	signal cont_V : integer := 0; 							-- Contador 2, inicializamos a 0
	signal S_M : STD_LOGIC;										-- Señal de reloj M
	signal S_V : STD_LOGIC;										-- Señal de reloj V

begin

	PROC_CONT : process (CLK)
		begin
			if CLK'event and CLK='1' then			
				cont_M<=cont_M + 1;								-- Aumentamos en 1 el contador M
				cont_V<=cont_V + 1;								-- Aumentamos en 1 el contador V
				if cont_M=(R_SISTEMA/R_MUESTREO) then 		-- Division de frecuencia a 40 Hz
					S_M<=not S_M;									-- Cambiamos de 0->1 o 1->0
					cont_M<= 0;										-- Ponemos el contador de M a 0
				end if;
				if cont_V=(R_SISTEMA/R_REFRESCO) then 		-- division de frecuencia a 1000 Hz
					S_V<=not S_V;									-- Cambiamos de 0->1 o 1->0
					cont_V<= 0;										-- Ponemos el contador de V a 0
				end if;
			end if;
			end process;
			
		CLK_M<=S_M;													-- Metemos el valor en la señal de la salida
		CLK_V<=S_V;													-- Metemos el valor en la señal de la salida
				
end Behavioral;
