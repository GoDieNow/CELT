----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    Refresco (Visualizacion) 
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

entity refresco is
	port ( 
			CLK : in STD_LOGIC; -- Reloj
			S 	 : out STD_LOGIC_VECTOR (1 downto 0);  -- Control para el mux
			AN  : out STD_LOGIC_VECTOR (3 downto 0)); -- Control displays individuales

end refresco;

architecture Behavioral of refresco is

	signal contador 	: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal salida 		: STD_LOGIC_VECTOR (1 downto 0) := "00";

begin

	process (CLK)
		begin
			if CLK'event and CLK='1' then   -- el periodo del reloj es de 1 ms
				contador 		<= contador + '1';
				S 					<= "00";
				AN 				<= "0000";
				if contador = 500 then       -- con el transcurso de 10 ms.
				contador	<=	(others=>'0');
					case salida is 
						WHEN "00" => S <= "00"; 	AN <= "0001";
						WHEN "01" => S <= "01"; 	AN <= "0010";
						WHEN "10" => S <= "10"; 	AN <= "0100";
						WHEN "11" => S <= "11"; 	AN <= "1000";
						WHEN OTHERS => S <= "00";  AN <= "0000";
					end case;
					if salida = "11" then
						salida <= "00";
					else
						salida <= salida + 1;
					end if;
				end if;
			end if;
	end process;

end Behavioral;

