LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY shifter IS
    PORT (
        i_A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        i_C : IN STD_LOGIC;
        o_S : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END shifter;

ARCHITECTURE arch_shift OF shifter IS
BEGIN
    PROCESS (i_A, i_C)
    BEGIN
    -- 0 para esquerda e 1 para a direita
        o_S(0) <= i_A(0) AND i_C;
        o_S(1) <= (i_A(0) AND NOT(i_C)) OR (i_A(2) AND i_C);
        o_S(2) <= (i_A(1) AND NOT(i_C)) OR (i_A(3) AND i_C);
        o_S(3) <= (i_A(2) AND NOT(i_C));
    END PROCESS;
END arch_shift;
