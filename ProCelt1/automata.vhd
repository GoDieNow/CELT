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
			LEDS	 : out STD_LOGIC_VECTOR (5 downto 0);
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
					LEDS <= "000001";
					DATO 		<= '0';
					CAPTUR 	<= '0';
					VALID 	<= '0';
					if C0 = '0' and C1 = '0' then
						ST <= AVAN_ZM;
					end if;
			
				when AVAN_ZM => 									-- Estado que dura 20 ciclos de reloj
					LEDS <= "000010";
					cont <= cont + 1;
					DATO 		<= '0';
					CAPTUR 	<= '0';
					VALID 	<= '0';					-- Se incrementa el contador
					if(cont = 20) then							-- Si llega a 20
						cont <= 0;				-- Poner el contador a 0
						ST <= MUESTREO;							-- Y cambiar de estado
					else
						ST <= AVAN_ZM;								-- Si no ha llegado a 20 permanecer
					end if;
				
				when MUESTREO =>
					LEDS <= "000100";
					cont <= cont+1;
					DATO 		<= '0';
					CAPTUR 	<= '0';
					VALID 	<= '0';					-- Se incrementa el contador
					if(cont = 38) then							-- Si llega a 38
						cont <= 0;						-- Poner el contador a 0
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
--							case tmp is							-- Y cambiar de estado
--							when "00" => ST <= DATOSYNC;
--							when "01" => ST <= DATO1;
--							when "10" => ST <= DATO0;
--							WHEN OTHERS => ST <= MUESTREO;
--						end case;
					else
						ST <= MUESTREO;							-- Si no ha llegado a 38 permanecer
					end if;
					
				when DATO0 =>
					LEDS <= "001000";
					DATO 		<= '0';
					VALID 	<= '0';
					CAPTUR 	<= '1';
					ST			<= MUESTREO;
				when DATO1 =>
				LEDS <= "010000";
					DATO 		<= '1';
					CAPTUR 	<= '1';
					VALID 	<= '0';
					ST			<= MUESTREO;
				when DATOSYNC =>
				LEDS <= "101010";
					VALID 	<= '1';
					DATO 		<= '0';
					CAPTUR 	<= '0';
					ST			<= MUESTREO;
			end case;
		end if;
	end process;
	
end Behavioral;

