----------------------------------------------------------------------------------
-- Company:	  Gattiken SL
-- Engineers: Javier Altable Gavilán
--				  Diego Martín Borreguero
-- 
-- Create Date:    16:39:26 10/16/2013 
-- Design Name: 	 
-- Module Name:    Principal 
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

entity principal is

    Port ( CLK 	 : in  STD_LOGIC; 												-- Entrada reloj
           ENTRADA : in  STD_LOGIC; 												-- Entrada serie datos
			  AN 		 : out STD_LOGIC_VECTOR (3 downto 0); 						-- Salida de control de displays
			  SEG7	 : out STD_LOGIC_VECTOR(6 DOWNTO 0)); 						-- Salida hacia displays
end principal;

architecture Behavioral of principal is

	-----------------------------
	-- Declaracion de Componentes
	-----------------------------
	component gen_reloj
		port (
			CLK	 : in  std_logic;  													-- Reloj de la FPGA
			CLK_M  : out std_logic;  													-- Reloj de muestreo
			CLK_V  : out std_logic); 													-- Reloj de refresco de displays 
	end component;
	
	component reg_desp40
		port (
			SIN : in STD_LOGIC; 															-- Datos de entrada serie 
			CLK : in STD_LOGIC; 															-- Reloj 
			Q	 : out STD_LOGIC_VECTOR (39 downto 0)); 							-- Salida paralelo 
	end component;
	
	component sumador40
		port (
			ENT : in STD_LOGIC_VECTOR (39 downto 0);								-- Entradas (40 bits) 
			SAL : out STD_LOGIC_VECTOR (5 downto 0)); 							-- Salida (6 bits) 
	end component;
	
	component comparador
		port (
			P 	  : in STD_LOGIC_VECTOR (5 downto 0); 								-- Entrada P 
			Q 	  : in STD_LOGIC_VECTOR (5 downto 0); 								-- Entrada Q 
			PGTQ : out STD_LOGIC;  														-- Salida P>Q 
			PLEQ : out STD_LOGIC); 														-- Salida P=Q
	end component;
	
	component AND_2
		port (
			A : in STD_LOGIC;	 	 														-- Entrada A 
			B : in STD_LOGIC;   															-- Entrada B 
			S : out STD_LOGIC); 															-- Salida
	end component;
	
	component reg_desp
		port (
			SIN : in STD_LOGIC; 															-- Datos de entrada serie 
			CLK : in STD_LOGIC; 															-- Reloj 
			EN  : in STD_LOGIC; 															-- Enable 
			Q 	 : out STD_LOGIC_VECTOR (13 downto 0)); 							-- Salida paralelo 
	end component;
	
	component registro
		port (
			ENTRADA : in STD_LOGIC_VECTOR (13 downto 0);	 						-- Entradas 
			SALIDA  : out STD_LOGIC_VECTOR (13 downto 0); 						-- Salidas 
			CLK 	  : in STD_LOGIC); 													-- Reloj 
	end component;
	
	component automata
		port (
			CLK 	 : in STD_LOGIC;														-- Reloj del autmata 
			C0 	 : in STD_LOGIC;	 													-- Condicion de decision para "0" 
			C1 	 : in STD_LOGIC;	 													-- Condicion de decision para "1" 
			DATO	 : out STD_LOGIC;	 													-- Datos a cargar 
			CAPTUR : out STD_LOGIC;	 													-- Enable del reg. de desplaz. 
--			LEDS	 : out STD_LOGIC_VECTOR (5 downto 0);
			VALID  : out STD_LOGIC); 													-- Activacion registro end automata; 
	end component;
	
	component visualizacion
		port (
			E0 	: in STD_LOGIC_VECTOR (3 downto 0); 							-- Entrada MUX 0 
			E1 	: in STD_LOGIC_VECTOR (3 downto 0); 							-- Entrada MUX 1 
			E2 	: in STD_LOGIC_VECTOR (3 downto 0); 							-- Entrada MUX 2 
			E3 	: in STD_LOGIC_VECTOR (3 downto 0); 							-- Entrada MUX 3 
			CLK 	: in STD_LOGIC; 														-- Entrada de reloj de refresco 
			SEG7 	: out STD_LOGIC_VECTOR (0 to 6); 								-- Salida para los displays 
			AN 	: out STD_LOGIC_VECTOR (3 downto 0)); 							-- Activacion 
	end component;
	
	----------------------
	-- Señales de mapeado
	----------------------
	signal SCLK_M		      : std_logic;											-- Se�al divisor-CLK_M
	signal SCLK_V		      : std_logic;											-- Se�al divisor-CLK_V
	signal SRD_I			   : std_logic_vector(39 downto 0);					-- Se�al Reg. desp-integrador
	signal SI_C					: std_logic_vector(5 downto 0);					-- Se�al integrador-comparador
	signal SC_AND1			   : std_logic;											-- Se�al comparador-AND
	signal SC_AND2			   : std_logic;											-- Se�al comparador-AND
	signal SC_AUT   		   : std_logic;											--	Se�al comparador-automata
	signal SAND_AUT    		: std_logic;											-- Se�al AND-automata
	signal SAUT_REGV 			: std_logic;											-- Se�al automata-Reg
	signal SAUT_RDESP_CAPT	: std_logic;											-- Se�al automata_Capt-Reg. desp
	signal SAUT_RDESP_DAT 	: std_logic;											-- Se�al automata_Dato-Reg. desp
	signal SRDESP_REGV   	: std_logic_vector(13 downto 0);					--	Se�al Reg. desp-Reg.
	signal SREGV_VISU 		: std_logic_vector(13 downto 0);					-- Se�al Reg-Visualizacion
	
	signal tmp0 : std_logic_vector(3 downto 0);									-- Creamos se�al temporal
	signal tmp2 : std_logic_vector(3 downto 0);									-- Creamos se�al temporal
	
	-----------------------------
	-- Constantes del Comparador
	-----------------------------
	constant U1 : STD_LOGIC_VECTOR (5 downto 0) := "100010";  				-- Cte U1 = 34 
	constant U2 : STD_LOGIC_VECTOR (5 downto 0) := "100110";  				-- Cte U2 = 38
	
	----------
	-- Alias
	----------
	
	alias AE3 : std_logic_vector(3 downto 0) is SREGV_VISU(3 downto 0);	-- Se�al particion de otra se�al
	alias AE1 : std_logic_vector(3 downto 0) is SREGV_VISU(10 downto 7);	-- Se�al particion de otra se�al
	
begin

	tmp2 <= '0' & SREGV_VISU(6 downto 4);											-- A�adimos un 0 al principio de otra se�al
	tmp0 <= '0' & SREGV_VISU(13 downto 11);										-- A�adimos un 0 al principio de otra se�al
	
	--------------------------
	-- Mapeado de Componentes
	--------------------------
	
	GENE_RELOJ: gen_reloj
    port map (
      CLK   => CLK,
      CLK_M => SCLK_M,
      CLK_V => SCLK_V);
	
	REG_DESPLAZAMIENTO_40: reg_desp40
    port map (
      CLK   => SCLK_M,
      SIN 	=> ENTRADA,
      Q 		=> SRD_I);

	SUMADOR: sumador40
    port map (
      ENT   => SRD_I,
      SAL 	=> SI_C);

	COMPARADOR1: comparador
    port map (
      P   	=> SI_C,
      Q 		=> U1,
      PGTQ  => SC_AND1,
      PLEQ  => SC_AUT);

	COMPARADOR2: comparador
    port map (
      P  	=> SI_C,
      Q 		=> U2,
      PLEQ	=> SC_AND2);
		
	AND_2ENT: AND_2
    port map (
		A		=> SC_AND1,
      B		=> SC_AND2,
      S		=> SAND_AUT);

	AUTOM: automata
    port map (
      CLK  		=> SCLK_M,
      C0 		=> SAND_AUT,
      C1 		=> SC_AUT,
      DATO  	=> SAUT_RDESP_DAT,
      CAPTUR   => SAUT_RDESP_CAPT,
      VALID    => SAUT_REGV);
		
	REG_DESPLAZAMIENTO: reg_desp
    port map (
      CLK   => SCLK_M,
      SIN 	=> SAUT_RDESP_DAT,
      EN 	=> SAUT_RDESP_CAPT,
      Q  	=> SRDESP_REGV);

	REGIST: registro
    port map (
      CLK     => SAUT_REGV,
      ENTRADA => SRDESP_REGV,
      SALIDA  => SREGV_VISU);

	VISUALIZA: visualizacion
    port map (
      CLK  	=> SCLK_V,
      E0 	=> tmp0,
      E1 	=> AE1,
      E2  	=> tmp2,
      E3  	=> AE3,
      SEG7  => SEG7,
		AN    => AN);

-- LED <= ;
--	LED1 <= LEDSS(1);
--	LED2 <= LEDSS(2);
--	LED3 <= LEDSS(3);
--	LED4 <= LEDSS(4);
--	LED5 <= LEDSS(5);

end Behavioral;

