----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    MUX4x4 (Visualizacion) 
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

entity MUX4x4 is
	port ( 
			E0 : in STD_LOGIC_VECTOR (3 downto 0); 	-- Entrada 0
			E1 : in STD_LOGIC_VECTOR (3 downto 0); 	-- Entrada 1
			E2 : in STD_LOGIC_VECTOR (3 downto 0); 	-- Entrada 2
			E3 : in STD_LOGIC_VECTOR (3 downto 0); 	-- Entrada 3
			S  : in STD_LOGIC_VECTOR (1 downto 0); 	-- Señal de control
			Y  : out STD_LOGIC_VECTOR (3 downto 0)); 	-- Salida

end MUX4x4;

architecture Behavioral of MUX4x4 is

begin

Y <= E0 when S="00" else  									-- Se selecciona la salida en funci�n de las entradas
     E1 when S="01" else  									-- de control
     E2 when S="10" else
     E3 when S="11";

end Behavioral;

