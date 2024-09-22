LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY comparador IS
    PORT (
        i_A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        i_B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        o_S : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END comparador;

ARCHITECTURE arch_comparador OF comparador IS
    SIGNAL eq : STD_LOGIC;
    SIGNAL maior : STD_LOGIC;
    SIGNAL menor : STD_LOGIC;
BEGIN
    PROCESS (i_A, i_B)
    BEGIN
        -- Verifica se A é igual a B
        eq <= ((i_A(0) XNOR i_B(0)) AND 
               (i_A(1) XNOR i_B(1)) AND 
               (i_A(2) XNOR i_B(2)) AND 
               (i_A(3) XNOR i_B(3)));

        -- Verifica se A é maior que B
        maior <= ( (NOT(i_B(3)) AND i_A(3)) OR
                   ((i_A(3) XNOR i_B(3)) AND (NOT(i_B(2)) AND i_A(2))) OR
                   ((i_A(3) XNOR i_B(3)) AND (i_A(2) XNOR i_B(2)) AND (NOT(i_B(1)) AND i_A(1))) OR
                   ((i_A(3) XNOR i_B(3)) AND (i_A(2) XNOR i_B(2)) AND (i_A(1) XNOR i_B(1)) AND (NOT(i_B(0)) AND i_A(0))) );

        -- Verifica se A é menor que B
        menor <= NOT (eq OR maior); -- NOR não é suportado pelo tipo std_logic

        -- Atribui os resultados ao vetor de saída
        o_S(0) <= eq;     -- A == B
        o_S(1) <= menor;  -- A < B
        o_S(2) <= maior;  -- A > B
    END PROCESS;
END arch_comparador;
