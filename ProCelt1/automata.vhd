----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    Automata 
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

entity automata is
		port (
			CLK 	 : in STD_LOGIC;	 -- Reloj del autmata 
			C0 	 : in STD_LOGIC;	 -- Condicin de decision para "0" 
			C1 	 : in STD_LOGIC;	 -- Condicin de decisin para "1" 
			DATO	 : out STD_LOGIC;	 -- Datos a cargar 
			CAPTUR : out STD_LOGIC;	 -- Enable del reg. de desplaz.
			--LEDS	 : out STD_LOGIC_VECTOR (5 downto 0);
			VALID  : out STD_LOGIC); -- Activacin registro end automata; 
end automata;

architecture Behavioral of automata is
	
	TYPE tipo_estado IS (ESP_SYNC, AVAN_ZM, MUESTREO, DATO0, DATO1, DATOSYNC);
	
	signal ST 	: tipo_estado 	:= ESP_SYNC; 	-- Estado inicial en que arranca
	signal cont : integer 		:= 0; -- contador para contar ciclos de un estado, iniciado a 0
	-- signal tmp : STD_LOGIC_VECTOR (1 downto 0);
	
begin
	process (CLK, C0, C1, ST)
		begin
		
		if (CLK'event and CLK = '1') then
				
			case ST is
				when ESP_SYNC =>									-- Estado normal, dura 1 ciclo de reloj
					if C0 = '0' and C1 = '0' then
						ST <= AVAN_ZM;
					end if;
			
				when AVAN_ZM => 									-- Estado que dura 20 ciclos de reloj
					cont <= cont + 1;				-- Se incrementa el contador
					if(cont = 20) then							-- Si llega a 20
						cont <= 0;				-- Poner el contador a 0
						ST <= MUESTREO;							-- Y cambiar de estado
					else
						ST <= AVAN_ZM;								-- Si no ha llegado a 20 permanecer
					end if;
				
				when MUESTREO =>
					cont <= cont+1;
					if(cont = 38) then
						cont <= 0;
						if C0 = '0' then
							if C1 = '0' then
								ST <= DATOSYNC;
							else
								ST <= DATO1;
							end if;
						else
							if C1 = '0' then
								ST <= DATO0;
							else
								ST <= MUESTREO;
							end if;
						end if;
					else
						ST <= MUESTREO;
					end if;
					
				when DATO0 =>
					ST			<= MUESTREO;
				
				when DATO1 =>
					ST			<= MUESTREO;
				
				when DATOSYNC =>
					ST			<= MUESTREO;
					
			end case;
			
		end if;
		
	end process;
	
	-- Salidas
	
	DATO 		<= '1' when ST=DATO1 else
					'0';
	CAPTUR 	<= '1' when ST=DATO0 else
					'1' when ST=DATO1 else
					'0';
	VALID 	<= '1' when ST=DATOSYNC else
					'0';
--	LEDS		<= "000001" when ST=ESP_SYNC 	else
--					"000010" when ST=AVAN_ZM 	else
--					"000100" when ST=MUESTREO 	else
--					"001000" when ST=DATO1 		else
--					"010000" when ST=DATO0 		else
--					"100000" when ST=DATOSYNC 	else
--					"000000";
	
end Behavioral;

