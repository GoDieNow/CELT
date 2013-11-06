----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    Registro de Desplazamiento
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

entity reg_desp is
end reg_desp;

architecture Behavioral of reg_desp is
		port (
			SIN : in STD_LOGIC; -- Datos de entrada serie 
			CLK : in STD_LOGIC; -- Reloj 
			EN  : in STD_LOGIC; -- Enable 
			Q 	 : out STD_LOGIC_VECTOR (13 downto 0)); -- Salida paralelo 
begin


end Behavioral;
