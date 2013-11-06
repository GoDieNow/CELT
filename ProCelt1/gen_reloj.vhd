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
	
	signal cont_M : STD_LOGIC_VECTOR (31 downto 0); -- contador 1
	signal cont_V : STD_LOGIC_VECTOR (31 downto 0); -- contador 2
	signal S_M : STD_LOGIC;
	signal S_V : STD_LOGIC;

begin

	PROC_CONT : process (CLK)
		begin
			if CLK'event and CLK='1' then
				cont_M<=cont_M + 1;
				cont_V<=cont_V + 1;
				if cont_M="100110001001011010000" then 		-- division de frecuencia a 40 Hz
					S_M<=not S_M;
					cont_M<=(others=>'0');
				end if;
				if cont_M="1100001101010000" then 		-- division de frecuencia a 1000 Hz
					S_V<=not S_V;
					cont_V<=(others=>'0');
				end if;
			end if;
			end process;
			
		CLK_M<=S_M;
		CLK_V<=S_V;
				
end Behavioral;
