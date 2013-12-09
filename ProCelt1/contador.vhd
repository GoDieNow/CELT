----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    19:07:47 12/09/2013 
-- Design Name: 
-- Module Name:    contador - Behavioral 
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

entity contador is
    Port ( CLK : in  STD_LOGIC;
           C 	: in  STD_LOGIC;
           EN 	: out  STD_LOGIC;
           S 	: out  STD_LOGIC_VECTOR (5 downto 0));
end contador;

architecture Behavioral of contador is

	signal SAUX	: std_logic_vector(5 downto 0) := "000000" ;
	signal SC : std_logic := '0';
	
	constant C1 : natural := 16;  	-- Cte U1 = 18; 
	constant C2 : natural := 42;  	-- Cte U2 = 42;

begin
	process (CLK, C)
	begin
		if (CLK'event and CLK = '1') then
			SAUX <= SAUX + 1;
			
			if C='1' then
				SC <= '1';
				SAUX <= "000000";
			end if;
			
			if SC='0' and SAUZ >= C1 then
				SAUX <= "000000";
			end if;
			
			if SC='1' and SAUZ = C2 then
				SAUX <= "000000";
			end if;
			
		end if;
	end process;
	
	-----------
	-- Salidas
	-----------
	S <= SAUX;
	
end Behavioral;

