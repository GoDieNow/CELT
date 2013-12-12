----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    19:10:07 12/09/2013 
-- Design Name: 
-- Module Name:    reg_desp5 - Behavioral 
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
-- Éste módulo hace las funciones de un registro de desplazamiento con entradas/salidas de 5bits
---------------------------------------------------------------------------------------------------------------------

entity reg_desp5 is
    Port ( E 	: in  STD_LOGIC_VECTOR (4 downto 0);				-- Entrada desde el traductor
           CLK : in  STD_LOGIC;											-- Señal del reloj
           S0 	: out STD_LOGIC_VECTOR (4 downto 0);				-- Salida hacia el MUX de Visualiza: E0
			  S1  : out STD_LOGIC_VECTOR (4 downto 0);				-- Salida hacia el MUX de Visualiza: E1
			  S2  : out STD_LOGIC_VECTOR (4 downto 0);				-- Salida hacia el MUX de Visualiza: E2
			  S3  : out STD_LOGIC_VECTOR (4 downto 0));				-- Salida hacia el MUX de Visualiza: E3
end reg_desp5;

architecture Behavioral of reg_desp5 is
	signal S0AUX	: std_logic_vector(4 downto 0) := "00000" ;	-- Registros internos para mantener constantes las salidas
	signal S1AUX	: std_logic_vector(4 downto 0) := "00000" ;
	signal S2AUX	: std_logic_vector(4 downto 0) := "00000" ;
	signal S3AUX	: std_logic_vector(4 downto 0) := "00000" ;

begin
	
	process (CLK)
	begin
		if (CLK'event and CLK = '1') then								-- Flanco positivo de reloj
			S0AUX <= S1AUX;													-- Desplazamos las salidas de derecha a izquierda
			S1AUX <= S2AUX;
			S2AUX <= S3AUX;
			S3AUX <= E;															-- Añadiendo la nueva entrada a la derecha del todo.
		end if;
	end process;
	
	-----------
	-- Salidas
	-----------
	S0 <= S0AUX;																-- Pasamos las salidas al siguiente módulo
	S1 <= S1AUX;
	S2 <= S2AUX;
	S3 <= S3AUX;
	
end Behavioral;

