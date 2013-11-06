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
			E0 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada 0
			E1 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada 1
			E2 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada 2
			E3 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada 3
			S  : in STD_LOGIC_VECTOR (1 downto 0); -- Señal de control
			Y  : out STD_LOGIC_VECTOR (3 downto 0)); -- Salida

end MUX4x4;

architecture Behavioral of MUX4x4 is

begin

	process (S)
		begin
			case S is 
				WHEN "00" => Y <= E0;
				WHEN "01" => Y <= E1;
				WHEN "10" => Y <= E2;
				WHEN "11" => Y <= E3;
				WHEN OTHERS => Y <= "XXXX";
		end case;
	end process;

end Behavioral;

