----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    Automata 
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

entity automata is
		port (
			CLK 	 : in STD_LOGIC;	 -- Reloj del autmata 
			C0 	 : in STD_LOGIC;	 -- Condicin de decision para "0" 
			C1 	 : in STD_LOGIC;	 -- Condicin de decisin para "1" 
			DATO	 : out STD_LOGIC;	 -- Datos a cargar 
			CAPTUR : out STD_LOGIC;	 -- Enable del reg. de desplaz. 
			VALID  : out STD_LOGIC); -- Activacin registro end automata; 
end automata;

architecture Behavioral of automata is

begin


end Behavioral;

