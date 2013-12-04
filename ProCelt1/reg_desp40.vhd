----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    Registro 
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

entity reg_desp40 is
	port ( 
			SIN : in STD_LOGIC; 																							-- Datos de entrada serie 
			CLK : in STD_LOGIC; 																							-- Reloj 
			Q	 : out STD_LOGIC_VECTOR (39 downto 0)); 															-- Salida paralelo 
end reg_desp40;

architecture Behavioral of reg_desp40 is

	signal QAUX : STD_LOGIC_VECTOR (39 downto 0) := "0000000000000000000000000000000000000000";	-- Creacion se�al auxiliar de 40 bits
	
begin

	process(CLK)
		begin
			if CLK'event and CLK = '1' then																			-- Condicion de evento y activiacion con flanco de subida
				QAUX <= SIN & QAUX (39 downto 1);																	-- Completamos la se�al de entrada con 0 hasta 40
			end if;
	end process;	

	Q <= QAUX;																												-- Metemos la se�al auxiliar a la salida

end Behavioral;

