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
		--Mensaje de "Buenas tardes"
	constant m0	: std_logic_vector(4 downto 0) := "01011"; -- b
	constant m1	: std_logic_vector(4 downto 0) := "01100"; -- u
	constant m2	: std_logic_vector(4 downto 0) := "01101"; -- E
	constant m3	: std_logic_vector(4 downto 0) := "01110"; -- n
	constant m4	: std_logic_vector(4 downto 0) := "01111"; -- A
	constant m5	: std_logic_vector(4 downto 0) := "10000"; -- S
	constant m6	: std_logic_vector(4 downto 0) := "01010"; --" "
	constant m7	: std_logic_vector(4 downto 0) := "10001"; -- t
	constant m8	: std_logic_vector(4 downto 0) := "01111"; -- A
	constant m9	: std_logic_vector(4 downto 0) := "10010"; -- r
	constant m10	: std_logic_vector(4 downto 0) := "10011"; -- d
	constant m11	: std_logic_vector(4 downto 0) := "01101"; -- E
	constant m12	: std_logic_vector(4 downto 0) := "10000"; -- S
	constant m13	: std_logic_vector(4 downto 0) := "01010"; --" "
	constant m14	: std_logic_vector(4 downto 0) := "01010"; --" "
	constant m15	: std_logic_vector(4 downto 0) := "01010"; --" "
	constant m16	: std_logic_vector(4 downto 0) := "01010"; --" "

		--Mensaje de "Son las XX..."
	constant t0	: std_logic_vector(4 downto 0) := "10000"; -- S
	constant t1	: std_logic_vector(4 downto 0) := "10100"; -- o
	constant t2	: std_logic_vector(4 downto 0) := "01110"; -- n
	constant t3	: std_logic_vector(4 downto 0) := "01010"; --" "
	constant t4	: std_logic_vector(4 downto 0) := "10101"; -- L
	constant t5	: std_logic_vector(4 downto 0) := "01111"; -- A
	constant t6	: std_logic_vector(4 downto 0) := "10000"; -- S
	constant t7	: std_logic_vector(4 downto 0) := "01010"; --" "
	--8 a 11 = HH:MM
	signal SH1	: std_logic_vector(4 downto 0) := "00000"; -- Digito 1 Hora
	signal SH2	: std_logic_vector(4 downto 0) := "00000"; -- Digito 2 Hora
	signal SM1	: std_logic_vector(4 downto 0) := "00000"; -- Digito 1 Minutos
	signal SM2	: std_logic_vector(4 downto 0) := "00000"; -- Digito 2 Minutos
	constant t12	: std_logic_vector(4 downto 0) := "01010"; --" "
	constant t13	: std_logic_vector(4 downto 0) := "10011"; -- d
	constant t14	: std_logic_vector(4 downto 0) := "01101"; -- E
	constant t15	: std_logic_vector(4 downto 0) := "10101"; -- L
	constant t16	: std_logic_vector(4 downto 0) := "01010"; --" "
	--17 a 19 = día de la semana
	signal SSM1	: std_logic_vector(4 downto 0) := "00000"; -- Digito 1 Dia semana
	signal SSM2	: std_logic_vector(4 downto 0) := "00000"; -- Digito 2 Dia semana
	signal SSM3	: std_logic_vector(4 downto 0) := "00000"; -- Digito 3 Dia semana
	constant t20	: std_logic_vector(4 downto 0) := "01010"; --" "
	--21 y 22 = dia del mes
	constant SD1	: std_logic_vector(4 downto 0) := "00000"; -- Digito 1 Dia
	constant SD2	: std_logic_vector(4 downto 0) := "00000"; -- Digito 2 Dia
	constant t23	: std_logic_vector(4 downto 0) := "01010"; --" "
	constant t24	: std_logic_vector(4 downto 0) := "10011"; -- d
	constant t25	: std_logic_vector(4 downto 0) := "01101"; -- E
	constant t26	: std_logic_vector(4 downto 0) := "10101"; -- L
	constant t27	: std_logic_vector(4 downto 0) := "01010"; --" "
	--28 y 29 = mes
	signal SMS1	: std_logic_vector(4 downto 0) := "00000"; -- Digito 1 Mes
	signal SMS2	: std_logic_vector(4 downto 0) := "00000"; -- Digito 2 Mes
	constant t30	: std_logic_vector(4 downto 0) := "01010"; --" "
	constant t31	: std_logic_vector(4 downto 0) := "10011"; -- d
	constant t32	: std_logic_vector(4 downto 0) := "01101"; -- E
	constant t33	: std_logic_vector(4 downto 0) := "01010"; --" "
	constant t34	: std_logic_vector(4 downto 0) := "00010"; -- #2
	constant t35	: std_logic_vector(4 downto 0) := "00000"; -- #0
	constant t36	: std_logic_vector(4 downto 0) := "00001"; -- #1
	constant t37	: std_logic_vector(4 downto 0) := "00011"; -- #3
	constant t38	: std_logic_vector(4 downto 0) := "01010"; --" "
	constant t39	: std_logic_vector(4 downto 0) := "01010"; --" "
	constant t40	: std_logic_vector(4 downto 0) := "01010"; --" "
	constant t41	: std_logic_vector(4 downto 0) := "01010"; --" "
	
	------------------------------
	-- Señales/Registros internos
	------------------------------
	signal SAL : std_logic_vector(4 downto 0) := "01010" ;  --Salida constante en blanco " " como inicial
	signal SC : std_logic := '0'; -- Control para saber si se está en mensaje de buenas tardes
											-- o en el de "Son las ..."
begin

	process (CLK)
	begin
		if (CLK'event and CLK = '1') then	-- Con flanco positivo de reloj
			if SC = '0' then						-- Si no se activa C, se muestra el saludo inicial
				case E is
					when "000000" => SAL <= m0;
					when "000001" => SAL <= m1;
					when "000010" => SAL <= m2;
					when "000011" => SAL <= m3;
					when "000100" => SAL <= m4;
					when "000101" => SAL <= m5;
					when "000110" => SAL <= m6;
					when "000111" => SAL <= m7;
					when "001000" => SAL <= m8;
					when "001001" => SAL <= m9;
					when "001010" => SAL <= m10;
					when "001011" => SAL <= m11;
					when "001100" => SAL <= m12;
					when "001101" => SAL <= m13;
					when "001110" => SAL <= m14;
					when "001111" => SAL <= m15;
					when "010000" => SAL <= m16;
					when others => SAL <= "01010"; --" "
				end case;
			else
				case E is							 -- Si se ha activado C, se muestra el mensaje de hora 
					when "000000" => SAL <= t0;
					when "000001" => SAL <= t1;
					when "000010" => SAL <= t2;
					when "000011" => SAL <= t3;
					when "000100" => SAL <= t4;
					when "000101" => SAL <= t5;
					when "000110" => SAL <= t6;
					when "000111" => SAL <= t7;
					when "001000" => SAL <= SH1; --8
					when "001001" => SAL <= SH2;
					when "001010" => SAL <= SM1;
					when "001011" => SAL <= SM2; --11
					when "001100" => SAL <= t12;
					when "001101" => SAL <= t13;
					when "001110" => SAL <= t14;
					when "001111" => SAL <= t15;
					when "010000" => SAL <= t16;
					when "010001" => SAL <= SSM1; --17
					when "010010" => SAL <= SSM2;
					when "010011" => SAL <= SSM3; --19
					when "010100" => SAL <= t20;
					when "010101" => SAL <= SD1; --21
					when "010110" => SAL <= SD2; --22
					when "010111" => SAL <= t23;
					when "011000" => SAL <= t24;
					when "011001" => SAL <= t25;
					when "011010" => SAL <= t26;
					when "011011" => SAL <= t27;
					when "011100" => SAL <= SMS1; --28
					when "011101" => SAL <= SMS2; --29
					when "011110" => SAL <= t30;
					when "011111" => SAL <= t31;
					when "100000" => SAL <= t32;
					when "100001" => SAL <= t33;
					when "100010" => SAL <= t34;
					when "100011" => SAL <= t35;
					when "100100" => SAL <= t36;
					when "100101" => SAL <= t37;
					when "100110" => SAL <= t38;
					when "100111" => SAL <= t39;
					when "101000" => SAL <= t40;
					when "101001" => SAL <= t41;
					when "101010" => SAL <= t42;
					when others => SAL <= "01010"; --" "
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

