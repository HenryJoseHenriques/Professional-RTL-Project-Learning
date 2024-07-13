--UNVERSIDADE DO VALE DO ITAJAÍ
--
--Porta  AND descrita em VHDL
--
--Autor: Henry José
--



library ieee;
use ieee.std_logic_1164.all;

entity PAND is port
(
	a : in std_logic;
	b : in std_logic;
	o : out std_logic
);
end PAND;

architecture hardware of PAND is
begin

o <= a and b;

end hardware;