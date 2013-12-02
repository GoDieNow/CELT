----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable GavilÃ¡n
--				  Diego MartÃ­n Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    Refresco (Visualizacion) 
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

entity refresco is
	port ( 
			CLK : in STD_LOGIC; 											-- Reloj
			S 	 : out STD_LOGIC_VECTOR (1 downto 0);  			-- Control para el mux
			AN  : out STD_LOGIC_VECTOR (3 downto 0)); 			-- Control displays individuales

end refresco;

architecture Behavioral of refresco is

	---------------------------
	-- Declaracion de señales
	---------------------------
	signal contador 	: integer := 0;								-- Creamos señal contador e iniciamos a 0
	signal SS 		: STD_LOGIC_VECTOR (1 downto 0) := "00";	-- Creamos señal del control de los AN
	
begin

	process (CLK)
		begin
			if CLK'event and CLK='1' then   							-- Condicion de cambio de flanco activo a nivel alto
				contador 		<= contador + 1;						-- Aumenta contador en 1
				if contador = 5 then       							-- Transcurso de 5 ms.
					contador	<=	0;											-- Ponemos contador a 0
					SS <= SS + 1;											-- Aumentamos en 1 SS
				end if;
			end if;
	end process;
	
	S <= SS;
	AN <= "1110" when SS="00" else  	 								-- Activa cada display en function del valor de SS
			"1101" when SS="01" else
			"1011" when SS="10" else
			"0111" when SS="11";
			
end Behavioral;

