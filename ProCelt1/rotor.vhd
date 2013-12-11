----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    16:39:02 12/09/2013 
-- Design Name: 
-- Module Name:    rotor - Behavioral 
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

entity rotor is
    Port ( CLK : in  STD_LOGIC;
           E 	: in  STD_LOGIC_VECTOR (30 downto 0);
           C 	: in  STD_LOGIC;
           S0 	: out STD_LOGIC_VECTOR (4 downto 0);
           S1 	: out STD_LOGIC_VECTOR (4 downto 0);
           S2 	: out STD_LOGIC_VECTOR (4 downto 0);
           S3 	: out STD_LOGIC_VECTOR (4 downto 0));
end rotor;

architecture Behavioral of rotor is

	-----------------------------
	-- Declaracion de Componentes
	-----------------------------
	component contador
		port (
			CLK : in  STD_LOGIC;
			C 	 : in  STD_LOGIC;
			S	 : out STD_LOGIC_VECTOR (5 downto 0));
	end component;
	
	component traductor
		port ( 
			E	 : in  STD_LOGIC_VECTOR (5 downto 0);	-- Entrada del contador
			ER  : in  STD_LOGIC_VECTOR (30 downto 0); -- Entrada de datos del registro
			C 	 : in  STD_LOGIC;
			CLK	: in  STD_LOGIC;
			S	 : out STD_LOGIC_VECTOR (4 downto 0));
	end component;
	
	component reg_desp5
		port (
			E 	 : in  STD_LOGIC_VECTOR (4 downto 0);
			CLK :	in  STD_LOGIC;
			S0	 : out STD_LOGIC_VECTOR (4 downto 0);
			S1	 : out STD_LOGIC_VECTOR (4 downto 0);
			S2	 : out STD_LOGIC_VECTOR (4 downto 0);
			S3	 : out STD_LOGIC_VECTOR (4 downto 0));
	end component;
	
	----------------------
	-- Señales de mapeado
	----------------------
	
	signal SCON_TRAD  : std_logic_vector(5 downto 0);
	signal STRAD_REG  : std_logic_vector(4 downto 0);
	
begin

	--------------------------
	-- Mapeado de Componentes
	--------------------------

	CONT: contador
		port map (
			CLK => CLK,
			C 	 => C,
			S	 => SCON_TRAD);
	
	TRANS: traductor
		port map ( 
			E 	 => SCON_TRAD,	-- Entrada del contador
			ER  => E, 			-- Entrada de datos del registro
			CLK => CLK,
			C 	 => C, 
			S	 => STRAD_REG);
	
	RDESP5: reg_desp5
		port map (
			E 	 => STRAD_REG,
			CLK => CLK,
			S0	 => S0,
			S1	 => S1,
			S2	 => S2,
			S3	 => S3);
	
end Behavioral;

