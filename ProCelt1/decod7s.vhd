----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    Deco 7 Segmentos (Visualizacion) 
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

entity decod7s is
	port (
			D : in STD_LOGIC_VECTOR (3 downto 0); 	-- Entrada BCD
			S : out STD_LOGIC_VECTOR (0 to 6));   	-- Salida para excitar los displays

end decod7s;

architecture Behavioral of decod7s is
begin

	with D select S <=									-- Seleccion de LEDs encendidos segun una entrada
		"0000001" when "0000",
		"1001111" when "0001",
		"0010010" when "0010",
		"0000110" when "0011",
		"1001100" when "0100",
		"0100100" when "0101",
		"0100000" when "0110",
		"0001111" when "0111",
		"0000000" when "1000",
		"0001100" when "1001",
		"0001000" when "1010",
		"1100000" when "1011",
		"0110001" when "1100",
		"1000010" when "1101",
		"0110000" when "1110",
		"0111000" when "1111",
		"1111111" when others;

end Behavioral;

