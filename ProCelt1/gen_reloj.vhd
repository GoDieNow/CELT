----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    Generador de Reloj
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

entity gen_reloj is
	port ( 
			CLK   : in STD_LOGIC; 		-- Reloj de la FPGA
			CLK_M : out STD_LOGIC;		-- Reloj de muestreo
			CLK_V : out STD_LOGIC );  -- Reloj de refresco de displays
end gen_reloj;

architecture Behavioral of gen_reloj is

begin


end Behavioral;
