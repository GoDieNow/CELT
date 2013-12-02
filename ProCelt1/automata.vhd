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
			CLK 	 : in STD_LOGIC;	 					-- Reloj del automata 
			C0 	 : in STD_LOGIC;	 					-- Condicion de decision para "0" 
			C1 	 : in STD_LOGIC;	 					-- Condicion de decision para "1" 
			DATO	 : out STD_LOGIC;	 					-- Datos a cargar 
			CAPTUR : out STD_LOGIC;	 					-- Enable del reg. de desplaz.
			VALID  : out STD_LOGIC); 					-- Activacion registro end automata; 
end automata;

architecture Behavioral of automata is
	
	-----------------------------
	-- Definicion de estados
	-----------------------------
	
	TYPE tipo_estado IS (ESP_SYNC, AVAN_ZM, MUESTREO, DATO0, DATO1, DATOSYNC);
	
	-----------------------------
	-- Declaracion de se�ales
	-----------------------------
	
	signal ST 	: tipo_estado 	:= ESP_SYNC; 		-- Estado inicial en que arranca, inicializado a ESP_SYNC
	signal cont : integer 		:= 0; 				-- Contador para contar ciclos de un estado, iniciado a 0
	
begin
	process (CLK, C0, C1, ST)							-- Process suceptible a los cambios de CLK, C0, C1 y ST
		begin
		
		if (CLK'event and CLK = '1') then
				
			case ST is
				when ESP_SYNC =>							-- Estado normal, dura 1 ciclo de reloj
					if C0 = '0' and C1 = '0' then		-- Si tenemos C0 y C1 en 0
						ST <= AVAN_ZM;						-- Cambiamos al estado de AVAN_ZM
					end if;
			
				when AVAN_ZM => 							-- Estado que dura 20 ciclos de reloj
					cont <= cont + 1;						-- Se incrementa el contador en 1
					if(cont = 20) then					-- Si llega a 20
						cont <= 0;							-- Poner el contador a 0
						ST <= MUESTREO;					-- Y cambiar de estado
					else
						ST <= AVAN_ZM;						-- Si no ha llegado a 20 permanecer en el mismo estado
					end if;
				
				when MUESTREO =>
					cont <= cont+1;						-- Aumentamos el contador
					if(cont = 38) then					-- Si el contador llega a 38
						cont <= 0;							-- Se pone el contador a 0
						if C0 = '0' then					-- Si C0 es 0, evaluamos C1
							if C1 = '0' then				-- Si C1 es 0
								ST <= DATOSYNC;			-- Se trata de una SYNC
							else
								ST <= DATO1;				-- Si C1 es 1, se para a DATO1
							end if;
						else
							if C1 = '0' then				-- Si C1 es 0
								ST <= DATO0;				-- Pasamos al estado de DATO0
							else
								ST <= MUESTREO;			-- Si C1 es 1, pasamos al estado MUESTREO
							end if;
						end if;
					else
						ST <= MUESTREO;					-- Si el contador no ha llegado a 38, nos mantenemos
					end if;
					
				when DATO0 =>
					ST			<= MUESTREO;				-- Despues del estado DATO0 es MUESTREO
				
				when DATO1 =>
					ST			<= MUESTREO;				-- Despues del estado DATO1 es MUESTREO
				
				when DATOSYNC =>
					ST			<= MUESTREO;				-- Despues del estado DATOSYNC es MUESTREO
					
			end case;
			
		end if;
		
	end process;
	
	------------
	-- Salidas
	------------
	
	DATO 		<= '1' when ST=DATO1 else
					'0';
	CAPTUR 	<= '1' when ST=DATO0 else
					'1' when ST=DATO1 else
					'0';
	VALID 	<= '1' when ST=DATOSYNC else
					'0';
	
end Behavioral;