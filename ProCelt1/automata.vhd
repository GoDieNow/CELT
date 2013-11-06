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
			VALID  : out STD_LOGIC); -- Activacin registro end automata; 
end automata;

architecture Behavioral of automata is
	
	TYPE tipo_estado IS (ESP_SYNC, AVAN_ZM, MUESTREO, DATO0, DATO1, DATOSYNC);
	
	signal ST 	: tipo_estado := ESP_SYNC; 						-- Estado inicial en que arranca
	signal cont : STD_LOGIC_VECTOR (7 downto 0):="00000000"; -- contador para contar ciclos de un estado, iniciado a 0

begin
	process (CLK)
		variable tmp : STD_LOGIC_VECTOR (1 downto 0);
		begin
		tmp := C0&C1;
		
			DATO 		<= '0';
			CAPTUR 	<= '0';
			VALID 	<= '0';
					
		if (CLK'event and CLK = '1') then
					
			case ST is
			
				when ESP_SYNC =>									-- Estado normal, dura 1 ciclo de reloj
				
					if C0 = '0' AND C1 = '0' then
						ST <= AVAN_ZM;
					end if;
			
				when AVAN_ZM => 									-- Estado que dura 20 ciclos de reloj
				
					cont <= cont+1;								-- Se incrementa el contador
					if(cont = 20) then							-- Si llega a 20
						cont <= (others => '0');				-- Poner el contador a 0
						ST <= MUESTREO;							-- Y cambiar de estado
					else
						ST <= AVAN_ZM;								-- Si no ha llegado a 20 permanecer
					end if;
				
				when MUESTREO =>
				
					cont <= cont+1;								-- Se incrementa el contador
					if(cont = 38) then							-- Si llega a 38
						cont <= (others => '0');				-- Poner el contador a 0
						case tmp is							-- Y cambiar de estado
							when "00" => ST <= DATOSYNC;
							when "01" => ST <= DATO1;
							when "10" => ST <= DATO0;
							WHEN OTHERS => ST <= MUESTREO;
						end case;
					else
						ST <= MUESTREO;							-- Si no ha llegado a 38 permanecer
					end if;
					
				when DATO0 =>
					CAPTUR 	<= '1';
					ST			<= MUESTREO;
				when DATO1 =>
					DATO 		<= '1';
					CAPTUR 	<= '1';
					ST			<= MUESTREO;
				when DATOSYNC =>
					VALID 	<= '1';
					ST			<= MUESTREO;
			end case;
		end if;
	end process;
	
end Behavioral;

