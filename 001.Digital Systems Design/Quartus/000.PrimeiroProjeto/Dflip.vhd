library ieee;
use ieee.std_logic_1164.all;

ENTITY Dflip is
port(
	Q : out std_logic;
	D : in std_LOGIC;
	PRE : in std_logic;
	CLR : in std_logic;
	CLK : in Std_Logic -- Não termina com ;
); 
END Dflip;

ARCHITECTURE logic of Dflip iS 
Begin
	PROCESS (CLK) -- Tudo que fica dentro do process se torna sincrono, fora dele, assincrono. É necessário colocar um sinal - nesse caso o "(CLK)" - para indicar para o sistema em função de qual sinal o sistema vai ativar. Ativa o evento
		begin --indica o começo do process
			--if (CLK = '1' and clk'event) -- outro jeito de fazer o descrito abaixo, le 'se CLK estiver em nivel alto E houve um evento com CLK'
			--if (CLK = '0' and clk'event -- borda de descida
			--IF(rising_edge(CLK)) then --le 'se ativado na borda de subida do CLK'
			IF(falling_edge(CLK)) then -- borda de descida. 'then' indica o começo
				Q <= D;
			end if; -- indica o fim do if
		end process; -- indica o fim do process 
	process (PRE)
		begin -- começo do process
			if(PRE = '1') then -- começo do if
				Q <= '1';
			end if; -- fim do if
	end Process; -- fim do process
		
	process (CLR)
		begin --começo do process
			if(CLR = '1') then -- começo do if
					Q <= '0';
			end if; -- fim do if
	end process; --fim do process
	-- os 3 process estão rodando 'em paralelo'
	-- tudo que rola dentro do process é sequencial, fora dele, é concorrente
end Logic;