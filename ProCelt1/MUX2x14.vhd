----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    20:45:44 12/03/2013 
-- Design Name: 
-- Module Name:    MUX2x14 - Behavioral 
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

entity MUX2x14 is
    Port ( E0 	: in  STD_LOGIC_VECTOR (13 downto 0);	-- Entrada 0
           E1 	: in  STD_LOGIC_VECTOR (13 downto 0);	-- Entrada 1
           S 	: in  STD_LOGIC;								-- Señal de control
           Y 	: out STD_LOGIC_VECTOR (13 downto 0)); -- Salida
end MUX2x14;

architecture Behavioral of MUX2x14 is

begin

Y <= E0 when S='0' else  										-- Se selecciona la salida en funcin de las entradas
     E1 when S='1'; 												-- de control

end Behavioral;

