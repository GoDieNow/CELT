----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    Visualizacion 
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

entity visualizacion is
		port (
			E0 	: in STD_LOGIC_VECTOR (3 downto 0); -- Entrada MUX 0 
			E1 	: in STD_LOGIC_VECTOR (3 downto 0); -- Entrada MUX 1 
			E2 	: in STD_LOGIC_VECTOR (3 downto 0); -- Entrada MUX 2 
			E3 	: in STD_LOGIC_VECTOR (3 downto 0); -- Entrada MUX 3 
			CLK 	: in STD_LOGIC; -- Entrada de reloj de refresco 
			SEG7 	: out STD_LOGIC_VECTOR (0 to 6); -- Salida para los displays 
			AN 	: out STD_LOGIC_VECTOR (3 downto 0)); -- Activacin 
end visualizacion;

architecture Behavioral of visualizacion is

	-----------------------------
	-- Declaracin de Componentes
	-----------------------------
	component MUX4x4
		port ( 
				E0 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada 0
				E1 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada 1
				E2 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada 2
				E3 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada 3
				S  : in STD_LOGIC_VECTOR (1 downto 0); -- Señal de control
				Y  : out STD_LOGIC_VECTOR (3 downto 0)); -- Salida
	end component;
	
	component decod7s
		port (
				D : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada BCD
				S : out STD_LOGIC_VECTOR (0 to 6));   -- Salida para excitar los displays
	end component;
	
	component refresco
		port ( 
				CLK : in STD_LOGIC; -- Reloj
				S 	 : out STD_LOGIC_VECTOR (1 downto 0);  -- Control para el mux
				AN  : out STD_LOGIC_VECTOR (3 downto 0)); -- Control displays individuales
	end component;

	----------------------
	-- Señales de mapeado
	----------------------
	signal SREF_MUX  : std_logic_vector(1 downto 0);
	signal SMUX_DECO : std_logic_vector(3 downto 0);

begin
	--------------------------
	-- Mapeado de Componentes
	--------------------------
	
	MUX: MUX4x4
		port map (
						E0 => E0,
						E1 => E1,
						E2 => E2,
						E3 => E3,
						S  => SREF_MUX,
						Y  => SMUX_DECO);
						
	DECO: decod7s
		port map (
						D => SMUX_DECO,
						S => SEG7);
	
	REFRESCO: refresco
		port map (
						CLK => CLK,
						S   => SREF_MUX,						
						AN  => AN);
end Behavioral;

