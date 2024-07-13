library ieee;
use ieee.std_logic_1164.all;

entity PXNOR2 is
port(
	in1, in2 : in std_logic;
	out1 : out std_logic -- última linha não tem ';' 
);
end PXNOR2;

architecture logic of PXNOR2 is
	signal x, y: std_logic; -- isso é um "sinal", não é um pino, nem 'in' ou 'out', pense nele como um fio, uma fiação, para intemediador, aquele mesmo que vc vê na colunas intermediando as entradas e saídas.
begin
	x <= in1 AND in2; --Não é um pino! é um valor intermédiario
	y <= (not in1) and (not in2); --Não é um pino também...valor intermediário
	out1 <= x or y; --Agora sim, isso é um pino de saída
end logic;