----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    Comparador 
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

entity comparador is
	port (
			P 	  : in STD_LOGIC_VECTOR (5 downto 0); -- Entrada P 
			Q 	  : in STD_LOGIC_VECTOR (5 downto 0); -- Entrada Q 
			PGTQ : out STD_LOGIC;  -- Salida P>Q 
			PLEQ : out STD_LOGIC); -- Salida P=Q
end comparador;

architecture Behavioral of comparador is

	signal tmp : STD_LOGIC;
	signal tmp1 : STD_LOGIC;

begin
	process(P,Q)
		begin
			tmp <= '0'; 
			tmp1 <= '0';
			
			if P > Q then
				tmp <= '1';
			else
				tmp1 <= '1';
			end if;
	end process;
	
	PGTQ <= tmp;
	PLEQ <= tmp1;
	
end Behavioral;

