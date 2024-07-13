library ieee;
use ieee.std_logic_1164.all;

entity PAND2 is 
port(
	in1, in2 : in std_logic;
	out1 : out std_logic
);
end PAND2;

architecture logic of PAND2 is
begin
	out1 <= in1 and in2;
end logic;