----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavil√°n
--				  Diego Mart√≠n Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    AND_2 
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

entity AND_2 is
		port (
			A : in STD_LOGIC;	  				-- Entrada A 
			B : in STD_LOGIC;   				-- Entrada B 
			S : out STD_LOGIC); 				-- Salida
end AND_2;

architecture Behavioral of AND_2 is

	---------------------------
	-- Declaracion de seÒales
	---------------------------
	signal tmp : STD_LOGIC;

begin

	process (A,B) 
		begin
			if A = '1' AND B = '1' THEN 	-- Cuando A y B son 1
				tmp <= '1'; 					-- Ponemos tmp a 1
			else 	
				tmp <= '0'; 					-- Si cualquiera de los dos es 0, ponemos tmp a 0
			end if; 
	end process;
	
	S <= tmp; 									-- Metemos la seÒal tmp en la salida
	
end Behavioral;

