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
			D : in STD_LOGIC_VECTOR (4 downto 0); 	-- Entrada codificada
			S : out STD_LOGIC_VECTOR (0 to 6));   	-- Salida para excitar los displays

end decod7s;

architecture Behavioral of decod7s is
begin

	with D select S <=	-- Seleccion de LEDs encendidos segun una entrada 1=0ff
	 --"ABCDEFG"
		"0000001" when "00000", -- #0
		"1001111" when "00001", -- #1
		"0010010" when "00010", -- #2
		"0000110" when "00011", -- #3
		"1001100" when "00100", -- #4
		"0100100" when "00101", -- #5
		"0100000" when "00110", -- #6
		"0001111" when "00111", -- #7
		"0000000" when "01000", -- #8
		"0001100" when "01001", -- #9
		"1111111" when "01010", -- " "			-- De aquí hacia abajo se añaden los 
		"1100000" when "01011", -- b				-- nuevos códigos para el saludo/mensaje
		"1100011" when "01100", -- u
		"0110000" when "01101", -- E
		"1101010" when "01110", -- n
		"0001000" when "01111", -- A
		"0100100" when "10000", -- S
		"1110000" when "10001", -- t
		"1111010" when "10010", -- r
		"1000010" when "10011", -- d
		"1100010" when "10100", -- o
		"1110001" when "10101", -- L
		"0001001" when "10110", -- M
		"0000011" when "10111", -- J
		"1000001" when "11000", -- V
		"1111001" when "11001", -- I
		"1111111" when others;

end Behavioral;

