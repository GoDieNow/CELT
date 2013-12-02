----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavil√°n
--				  Diego Mart√≠n Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    Sumador =/= 40 
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

entity sumador40 is
	port (
			ENT : in STD_LOGIC_VECTOR (39 downto 0);			-- Entrada (40 bits) 
			SAL : out STD_LOGIC_VECTOR (5 downto 0)); 		-- Salida (6 bits) 
end sumador40;

architecture Behavioral of sumador40 is

	-----------------------------
	-- Declaracion de seÒales
	-----------------------------
	
	signal E0 : STD_LOGIC_VECTOR (5 downto 0);
	signal E1 : STD_LOGIC_VECTOR (5 downto 0);
	signal E2 : STD_LOGIC_VECTOR (5 downto 0);
	signal E3 : STD_LOGIC_VECTOR (5 downto 0);
	signal E4 : STD_LOGIC_VECTOR (5 downto 0);
	signal E5 : STD_LOGIC_VECTOR (5 downto 0);
	signal E6 : STD_LOGIC_VECTOR (5 downto 0);
	signal E7 : STD_LOGIC_VECTOR (5 downto 0);
	signal E8 : STD_LOGIC_VECTOR (5 downto 0);
	signal E9 : STD_LOGIC_VECTOR (5 downto 0);
	signal E10 : STD_LOGIC_VECTOR (5 downto 0);
	signal E11 : STD_LOGIC_VECTOR (5 downto 0);
	signal E12 : STD_LOGIC_VECTOR (5 downto 0);
	signal E13 : STD_LOGIC_VECTOR (5 downto 0);
	signal E14 : STD_LOGIC_VECTOR (5 downto 0);
	signal E15 : STD_LOGIC_VECTOR (5 downto 0);
	signal E16 : STD_LOGIC_VECTOR (5 downto 0);
	signal E17 : STD_LOGIC_VECTOR (5 downto 0);
	signal E18 : STD_LOGIC_VECTOR (5 downto 0);
	signal E19 : STD_LOGIC_VECTOR (5 downto 0);
	signal E20 : STD_LOGIC_VECTOR (5 downto 0);
	signal E21 : STD_LOGIC_VECTOR (5 downto 0);
	signal E22 : STD_LOGIC_VECTOR (5 downto 0);
	signal E23 : STD_LOGIC_VECTOR (5 downto 0);
	signal E24 : STD_LOGIC_VECTOR (5 downto 0);
	signal E25 : STD_LOGIC_VECTOR (5 downto 0);
	signal E26 : STD_LOGIC_VECTOR (5 downto 0);
	signal E27 : STD_LOGIC_VECTOR (5 downto 0);
	signal E28 : STD_LOGIC_VECTOR (5 downto 0);
	signal E29 : STD_LOGIC_VECTOR (5 downto 0);
	signal E30 : STD_LOGIC_VECTOR (5 downto 0);
	signal E31 : STD_LOGIC_VECTOR (5 downto 0);
	signal E32 : STD_LOGIC_VECTOR (5 downto 0);
	signal E33 : STD_LOGIC_VECTOR (5 downto 0);
	signal E34 : STD_LOGIC_VECTOR (5 downto 0);
	signal E35 : STD_LOGIC_VECTOR (5 downto 0);
	signal E36 : STD_LOGIC_VECTOR (5 downto 0);
	signal E37 : STD_LOGIC_VECTOR (5 downto 0);
	signal E38 : STD_LOGIC_VECTOR (5 downto 0);
	signal E39 : STD_LOGIC_VECTOR (5 downto 0);

begin

	E39<="00000"&ENT(39);										-- Generamos 40 seÒales de 5 bits "00001"
	E38<="00000"&ENT(38);
	E37<="00000"&ENT(37);
	E36<="00000"&ENT(36);
	E35<="00000"&ENT(35);
	E34<="00000"&ENT(34);
	E33<="00000"&ENT(33);
	E32<="00000"&ENT(32);
	E31<="00000"&ENT(31);
	E30<="00000"&ENT(30);
	E29<="00000"&ENT(29);
	E28<="00000"&ENT(28);
	E27<="00000"&ENT(27);
	E26<="00000"&ENT(26);
	E25<="00000"&ENT(25);
	E24<="00000"&ENT(24);
	E23<="00000"&ENT(23);
	E22<="00000"&ENT(22);
	E21<="00000"&ENT(21);
	E20<="00000"&ENT(20);
	E19<="00000"&ENT(19);
	E18<="00000"&ENT(18);
	E17<="00000"&ENT(17);
	E16<="00000"&ENT(16);
	E15<="00000"&ENT(15);
	E14<="00000"&ENT(14);
	E13<="00000"&ENT(13);
	E12<="00000"&ENT(12);
	E11<="00000"&ENT(11);
	E10<="00000"&ENT(10);
	E9<="00000"&ENT(9);
	E8<="00000"&ENT(8);
	E7<="00000"&ENT(7);
	E6<="00000"&ENT(6);
	E5<="00000"&ENT(5);
	E4<="00000"&ENT(4);
	E3<="00000"&ENT(3);
	E2<="00000"&ENT(2);
	E1<="00000"&ENT(1);
	E0<="00000"&ENT(0);
	
	SAL<=E39+E38+E37+E36+E35+E34+E33+E32+E31+E30+E29+E28+E27+	-- Sumamos todas las entradas
		  E26+E25+E24+E23+E22+E21+E20+E19+E18+E17+E16+E15+E14+
		  E13+E12+E11+E10+E9+E8+E7+E6+E5+E4+E3+E2+E1+E0;

end Behavioral;

