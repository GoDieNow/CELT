----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
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
	generic (
		R_SISTEMA 	: integer := 50000000;					-- Reloj del sitema 50 MHz
      R_REFRESCO 	: integer := 2*1000;						-- Reloj de refresco 2*1 Khz
		R_MUESTREO 	: integer := 2*40;						-- Reloj de muestreo 2*40 Hz
		R_ROTACION 	: integer := 2*50							-- Reloj de rotacion 2*50 Hz
		);
	
	port ( 
			CLK   : in STD_LOGIC; 								-- Reloj de la FPGA
			CLK_M : out STD_LOGIC;								-- Reloj de muestreo
			CLK_R : out STD_LOGIC;								-- Reloj de rotacion
			CLK_V : out STD_LOGIC );  							-- Reloj de refresco de displays
end gen_reloj;

architecture Behavioral of gen_reloj is
	
	signal cont_M : integer := 0; 							-- Contador 1
	signal cont_V : integer := 0; 							-- Contador 2
	signal cont_R : integer := 0; 							-- Contador 3
	signal S_M : STD_LOGIC;										-- Seal interna del divisor
	signal S_V : STD_LOGIC;										-- Seal interna del divisor
	signal S_R : STD_LOGIC;										-- Seal interna del divisor

begin

	PROC_CONT : process (CLK)
		begin
			if CLK'event and CLK='1' then						-- Condicion cambio de flanco y flanco activo
				cont_M<=cont_M + 1;								-- Aumentamos el contador M en 1
				cont_V<=cont_V + 1;								-- Aumentamos el contador V en 1
				cont_R<=cont_R + 1;								-- Aumentamos el contador R en 1
				if cont_M=(R_SISTEMA/R_MUESTREO) then 		-- Division de frecuencia a 40 Hz
					S_M<=not S_M;									-- Se pasa de 0->1 o de 1->0
					cont_M<= 0;										-- Ponemos el contador de M a 0
				end if;
				if cont_V=(R_SISTEMA/R_REFRESCO) then 		-- Division de frecuencia a 1000 Hz
					S_V<=not S_V;									-- Se pasa de 0->1 o de 1->0
					cont_V<= 0;										-- Ponemos el contador V a 0
				end if;
				if cont_V=(R_SISTEMA/R_ROTACION) then 		-- Division de frecuencia a 50 Hz
					S_R<=not S_R;									-- Se pasa de 0->1 o de 1->0
					cont_R<= 0;										-- Ponemos el contador V a 0
				end if;
			end if;
		end process;
			
		CLK_M<=S_M;													-- Metemos el valor en la seal del reloj
		CLK_V<=S_V;													-- Metemos el valor en la seal del reloj
		CLK_R<=S_R;													-- Metemos el valor en la seal del reloj
				
end Behavioral;
