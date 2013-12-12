----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    19:07:47 12/09/2013 
-- Design Name: 
-- Module Name:    contador - Behavioral 
-- Project Name: 
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

---------------------------------------------------------------------------------------------------------------------
-- Este módulo, como su nombre indica, se dedica a ir contando ciclos de reloj y muestrarlos al siguiente módulo.
-- Tiene dos cuentas (hasta 16 y hasta 42) y conmuta de una a otra en función de la entrada C.
---------------------------------------------------------------------------------------------------------------------

entity contador is
    Port ( CLK : in  STD_LOGIC;										-- Señal del reloj
           C 	: in  STD_LOGIC;										-- Señal VALIDAR del autómata, sirve de conmutador entre saludo/mensaje de hora
           S 	: out  STD_LOGIC_VECTOR (5 downto 0));			-- Salida del módulo hacia el siguiente
end contador;

architecture Behavioral of contador is

	signal SAUX	: std_logic_vector(5 downto 0) := "000000" ; -- Señal interna para llevar la cuenta
	signal SC : std_logic := '0';										-- Señal interna para conmutar entre saludo/hora
	
	constant C1 : natural := 16;  									-- Cte de cuenta del saludo: U1 = 16;
	constant C2 : natural := 42;  									-- Cte de cuenta del mensaje: U2 = 42;

begin
	process (CLK, C)
	begin
		if (CLK'event and CLK = '1') then							-- Con flanco positivo del reloj
			SAUX <= SAUX + 1;												-- Aumenta contador
			
			if C='1' then													-- Si señal de conmutación activa
				SC <= '1';													-- Guardamos estado
				SAUX <= "000000";											-- Y reiniciamos la cuenta
			end if;
			
			if SC='0' and SAUX >= C1 then								-- Si hemos llegado al final del mensaje inicial, y aun no hemos conmutado, reiniciamos el contador
				SAUX <= "000000";
			end if;
			
			if SC='1' and SAUX = C2 then								-- Si hemos llegado al final del mensaje, y ya hemos conmutado, reiniciamos ese mensaje.
				SAUX <= "000000";
			end if;
			
		end if;
	end process;
	
	-----------
	-- Salidas
	-----------
	S <= SAUX; 																-- Pasamos el valor actual del contador al siguiente módulo.
	
end Behavioral;

