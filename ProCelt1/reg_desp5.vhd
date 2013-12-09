----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    19:10:07 12/09/2013 
-- Design Name: 
-- Module Name:    reg_desp5 - Behavioral 
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

entity reg_desp5 is
    Port ( E 	: in  STD_LOGIC_VECTOR (4 downto 0);
           CLK : in  STD_LOGIC;
           S0 	: out  STD_LOGIC_VECTOR (4 downto 0);
           S1 	: out  STD_LOGIC_VECTOR (4 downto 0);
           S2 	: out  STD_LOGIC_VECTOR (4 downto 0);
           S3 	: out  STD_LOGIC_VECTOR (4 downto 0));
end reg_desp5;

architecture Behavioral of reg_desp5 is
	signal S0AUX	: std_logic_vector(4 downto 0) := "00000" ;
	signal S1AUX	: std_logic_vector(4 downto 0) := "00000" ;
	signal S2AUX	: std_logic_vector(4 downto 0) := "00000" ;
	signal S3AUX	: std_logic_vector(4 downto 0) := "00000" ;

begin
	
	process (CLK)
	begin
		if (CLK'event and CLK = '1') then
			S0AUX <= S1AUX;
			S1AUX <= S2AUX;
			S2AUX <= S3AUX;
			S3AUX <= E;
		end if;
	end process;
	
	-----------
	-- Salidas
	-----------
	
	S0 <= S0AUX;
	S1 <= S1AUX;
	S2 <= S2AUX;
	S3 <= S3AUX;
	
end Behavioral;

