----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    16:39:02 12/09/2013 
-- Design Name: 
-- Module Name:    rotor - Behavioral 
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
-- Este subsistema está compuesto por tres componentes: un contador, un registro de desplazamiento y un "traductor"
-- que convierte el valor de la cuenta del contador en ese momento es un valor adecuado a guardar en el resgistro
-- de desplazamiento.
-- El funcionamiento, simplificando, consiste en tomar el valor de la cuenta para ir generando un mensaje que se 
-- va desplazando por los displays de 7 segmentos ofreciendo un saludo inicial y posteriormente un mensaje con la
-- hora en el formato "Son las HH:MM del DDS DD del MM de 2013"
---------------------------------------------------------------------------------------------------------------------
entity rotor is
    Port ( CLK : in  STD_LOGIC;									-- Señal del reloj
           E 	: in  STD_LOGIC_VECTOR (30 downto 0);		-- Entrada con los datos del registro
           C 	: in  STD_LOGIC;									-- Señal VALIDAR del autómata, sirve de conmutador entre saludo/mensaje de hora
           S0 	: out STD_LOGIC_VECTOR (4 downto 0);		-- Salida hacia el MUX de Visualiza: E0
           S1 	: out STD_LOGIC_VECTOR (4 downto 0);		-- Salida hacia el MUX de Visualiza: E1
           S2 	: out STD_LOGIC_VECTOR (4 downto 0);		-- Salida hacia el MUX de Visualiza: E2
           S3 	: out STD_LOGIC_VECTOR (4 downto 0));		-- Salida hacia el MUX de Visualiza: E3
end rotor;

architecture Behavioral of rotor is

	-----------------------------
	-- Declaracion de Componentes
	-----------------------------
	component contador
		port (
			CLK : in  STD_LOGIC;										-- Señal del reloj
			C 	 : in  STD_LOGIC;										-- Señal VALIDAR del autómata, sirve de conmutador entre saludo/mensaje de hora
			S	 : out STD_LOGIC_VECTOR (5 downto 0));			-- Salida del módulo hacia el siguiente
	end component;
	
	component traductor
		port ( 
			E	 : in  STD_LOGIC_VECTOR (5 downto 0);			-- Entrada desde el contador
			ER  : in  STD_LOGIC_VECTOR (30 downto 0); 		-- Entrada de datos del registro
			C 	 : in  STD_LOGIC;										-- Señal VALIDAR del autómata, sirve de conmutador entre saludo/mensaje de hora
			CLK : in  STD_LOGIC;										-- Señal del reloj
			S	 : out STD_LOGIC_VECTOR (4 downto 0));			-- Salida del módulo hacia el siguiente
	end component;
	
	component reg_desp5
		port (
			E 	 : in  STD_LOGIC_VECTOR (4 downto 0);			-- Entrada desde el traductor
			CLK :	in  STD_LOGIC;										-- Señal del reloj
			S0  : out STD_LOGIC_VECTOR (4 downto 0);			-- Salida hacia el MUX de Visualiza: E0
         S1  : out STD_LOGIC_VECTOR (4 downto 0);			-- Salida hacia el MUX de Visualiza: E1
         S2  : out STD_LOGIC_VECTOR (4 downto 0);			-- Salida hacia el MUX de Visualiza: E2
         S3  : out STD_LOGIC_VECTOR (4 downto 0));			-- Salida hacia el MUX de Visualiza: E3

	end component;
	
	----------------------
	-- Señales de mapeado
	----------------------
	
	signal SCON_TRAD  : std_logic_vector(5 downto 0);		-- Señal de unión Contador-Traductor
	signal STRAD_REG  : std_logic_vector(4 downto 0);		-- Señal de unión Traductor-Reg_Desplazamiento
	
begin

	--------------------------
	-- Mapeado de Componentes
	--------------------------

	CONT: contador
		port map (
			CLK => CLK,
			C 	 => C,
			S	 => SCON_TRAD);
	
	TRANS: traductor
		port map ( 
			E 	 => SCON_TRAD,
			ER  => E,
			CLK => CLK,
			C 	 => C, 
			S	 => STRAD_REG);
	
	RDESP5: reg_desp5
		port map (
			E 	 => STRAD_REG,
			CLK => CLK,
			S0	 => S0,
			S1	 => S1,
			S2	 => S2,
			S3	 => S3);
	
end Behavioral;

