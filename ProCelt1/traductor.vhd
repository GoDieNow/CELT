----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    19:08:41 12/09/2013 
-- Design Name: 
-- Module Name:    traductor - Behavioral 
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
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.ALL;
------------------------------------------------------------------------------------------------------------------------
-- Éste módulo se encarga de traducir el valor del contador en un valor concreto, según la secuencia guardada en
-- los arrays internos, de forma que el valor a su salida es posteriormente decodificado por el módulo de visualizacion
-- El módulo admite la entrada de una señal de control que permite conmutar entre dos posibles mensajes, así como la 
-- integración en el mensaje de los valores que llegan desde el resgitro.
------------------------------------------------------------------------------------------------------------------------

entity traductor is
    Port ( E 	: in  STD_LOGIC_VECTOR (5 downto 0); 									-- Entrada desde el contador
           ER 	: in  STD_LOGIC_VECTOR (30 downto 0); 									-- Entrada de datos del registro
           C 	: in  STD_LOGIC; 																-- Señal VALIDAR del autómata, sirve de conmutador entre saludo/mensaje de hora
			  CLK	: in  STD_LOGIC; 																-- Señal del reloj
           S 	: out  STD_LOGIC_VECTOR (4 downto 0)); 								-- Salida del módulo hacia el siguiente
end traductor;

architecture Behavioral of traductor is
	
	--------------------------------
	-- Pseudo memorias ROM internas
	--------------------------------
	type mem_type1 is array (16 downto 0) of std_logic_vector (4 downto 0); 	-- En lugar de usar un "case" con cerca de 70 posibilidades
	type mem_type is array (41 downto 0) of std_logic_vector (4 downto 0);		-- Se ha optado por dos arrays pensados como dos memorias ROM internas
	
	constant mem1 : mem_type1 :=																-- Memoria para el saludo inciial, con sus correspondencias en letras
	(0=> "01011", -- b
	1=> "01100", -- u
	2=> "01101", -- E
	3=> "01110", -- n
	4=> "01111", -- A
	5=> "10000", -- S
	6=> "01010", --" "
	7=> "10001", -- t
	8=> "01111", -- A
	9=> "10010", -- r
	10=> "10011", -- d
	11=> "01101", -- E
	12=> "10000", -- S
	13=> "01010", --" "
	14=> "01010", --" "
	15=> "01010", --" "
	16=> "01010"); --" "
	
	constant mem2 : mem_type :=																-- Memoria para el mensaje, con sus correspondencias en letras
	(0=> "10000", -- S
	1=> "10100", -- o
	2=> "01110", -- n
	3=> "01010",  --" "
	4=> "10101", -- L
	5=> "01111", -- A
	6=> "10000", -- S
	7=> "01010",  --" "
	--8 a 11 = HH:MM
	8=> "00000",
	9=> "00000",
	10=> "00000",
	11=> "00000",
	12=> "01010",  --" "
	13=> "10011", -- d
	14=> "01101", -- E
	15=> "10101", -- L
	16=> "01010",  --" "
	--17 a 19 = día de la semana
	17=> "00000",
	18=> "00000",
	19=> "00000",
	20=> "01010",  --" "
	--21 y 22 = dia del mes
	21=> "00000",
	22=> "00000",
	23=> "01010",  --" "
	24=> "10011", -- d
	25=> "01101", -- E
	26=> "10101", -- L
	27=> "01010",  --" "
	--28 y 29 = mes
	28=> "00000",
	29=> "00000",
	30=> "01010",  --" "
	31=> "10011", -- d
	32=> "01101", -- E
	33=> "01010",  --" "
	34=> "00010", -- #2
	35=> "00000", -- #0
	36=> "00001", -- #1
	37=> "00011", -- #3
	38=> "01010",  --" "
	39=> "01010",  --" "
	40=> "01010",  --" "
	41=> "01010");  --" "
	
	------------------------------
	-- Señales/Registros internos
	------------------------------
	signal SH1	: std_logic_vector(4 downto 0) := "00000" ; -- Digito 1 Hora
	signal SH2	: std_logic_vector(4 downto 0) := "00000" ; -- Digito 2 Hora

	signal SM1	: std_logic_vector(4 downto 0) := "00000" ; -- Digito 1 Minutos
	signal SM2	: std_logic_vector(4 downto 0) := "00000" ; -- Digito 2 Minutos

	signal SD1	: std_logic_vector(4 downto 0) := "00000" ; -- Digito 1 Dia
	signal SD2	: std_logic_vector(4 downto 0) := "00000" ; -- Digito 2 Dia

	signal SMS1	: std_logic_vector(4 downto 0) := "00000" ; -- Digito 1 Mes
	signal SMS2	: std_logic_vector(4 downto 0) := "00000" ; -- Digito 2 Mes

	signal SSM1	: std_logic_vector(4 downto 0) := "00000" ; -- Digito 1 Dia semana
	signal SSM2	: std_logic_vector(4 downto 0) := "00000" ; -- Digito 2 Dia semana
	signal SSM3	: std_logic_vector(4 downto 0) := "00000" ; -- Digito 3 Dia semana

	signal SC : std_logic := '0'; -- Control para saber si se está en mensaje de buenas tardes
											-- o en el de "Son las ..."
	signal SAL : std_logic_vector(4 downto 0) := "00000" ;  --Salida constante

begin

	process (CLK)
	begin
		if (CLK'event and CLK = '1') then							-- Con flanco positivo de reloj
			if SC = '0' then												-- Si no se activa C, se muestra el saludo inicial
				SAL <= mem1(to_integer(unsigned(E)));
			else
				case E is													-- Si se ha activado C, dependiendo del valor obtendremos o bien una posición de los arrays 
					when "001000" => --8									-- o bien un valor guardado en los registros internos...
						SAL <= SH1;
					when "001001" =>
						SAL <= SH2;
					when "001010" =>
						SAL <= SM1;
					when "001011" => --11
						SAL <= SM2;
					when "010101" => --21
						SAL <= SD1;
					when "010110" => --22
						SAL <= SD2;
					when "011100" => --28
						SAL <= SMS1;
					when "011101" => --29
						SAL <= SMS2;
					when "010001" => --17
						SAL <= SSM1;
					when "010010" =>
						SAL <= SSM2;
					when "010011" => --19
						SAL <= SSM3;
					when others =>
						SAL <= mem2(to_integer(unsigned(E)));
				end case;
			end if;
		end if;
	end process;

	process (C, ER)
	begin
		if C='1' then										-- Si C cambia, lo guardamos y copiamos los valores para nuestros registros
			SC   <= '1';
			SH1  <= "00" & ER(30 DOWNTO 28);
			SH2  <= '0' & ER(27 DOWNTO 24);
			SM1  <= "00" & ER(23 DOWNTO 21);
			SM2  <= '0' & ER(20 DOWNTO 17);
			SD1  <= "00" & ER(16 DOWNTO 14);
			SD2  <= '0' & ER(13 DOWNTO 10);
			SMS1 <= "00" & ER(9 DOWNTO 7);
			SMS2 <= '0' & ER(6 DOWNTO 3);
			case ER(2 downto 0) is						-- Como el día de la semana viene codificado con 3bits, lo decodificamos 
				when "000" => --Lun                 -- y re-codificamos según nuestro criterio: Se guardan las 3 primeras letras del día
					SSM1 <= "10101";
					SSM2 <= "01100";
					SSM3 <= "01110";
				when "001" => --Mar
					SSM1 <= "10110";
					SSM2 <= "01111";
					SSM3 <= "10010";
				when "010" => --Mie
					SSM1 <= "10110";
					SSM2 <= "11001";
					SSM3 <= "01101";
				when "011" => --Jue
					SSM1 <= "10111";
					SSM2 <= "01100";
					SSM3 <= "01101";
				when "100" => --Vie
					SSM1 <= "11000";
					SSM2 <= "11001";
					SSM3 <= "01101";
				when "101" => --Sab
					SSM1 <= "10000";
					SSM2 <= "01111";
					SSM3 <= "01011";
				when "110" => --Dom
					SSM1 <= "10011";
					SSM2 <= "10100";
					SSM3 <= "10110";
				when others =>
			end case;
		end if;
	end process;

	-----------
	-- Salidas
	-----------
	S <= SAL;												-- Se mantiene una salida constante hacia el siguiente módulo

end Behavioral;

