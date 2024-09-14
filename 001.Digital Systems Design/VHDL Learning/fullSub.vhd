LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY fullSub IS
    PORT (
        i_A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        i_B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        i_carryIn : IN STD_LOGIC;
        o_S : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        o_carryOut : OUT STD_LOGIC
    );
END fullSub;

ARCHITECTURE arch_fullSub OF fullSub IS

    SIGNAL carry : STD_LOGIC_VECTOR (3 DOWNTO 0);
BEGIN
    -- Processo para somar os bits de A e B e o carry-in
    PROCESS (i_A, i_B, i_carryIn)
    BEGIN
        -- Tá tudo errado, segundo o chat gpt
        o_S(0) <= i_A(0) XOR i_B(0) XOR i_carryIn;
        carry(0) <= (NOT(i_A(0)) AND i_B(0)) OR (NOT(i_A(0)) AND i_carryIn) OR (i_B(0) AND i_carryIn);
        
        o_S(1) <= i_A(1) XOR i_B(1) XOR carry(0);
        carry(1) <= (NOT(i_A(1)) AND i_B(1)) OR (NOT(i_A(1)) AND carry(0)) OR (i_B(1) AND carry(0));
        
        o_S(2) <= i_A(2) XOR i_B(2) XOR carry(1);
        carry(2) <= (NOT(i_A(2)) AND i_B(2)) OR (NOT(i_A(2)) AND carry(1)) OR (i_B(2) AND carry(1));
        
        o_S(3) <= i_A(3) XOR i_B(3) XOR carry(2);
        carry(3) <= (NOT(i_A(3)) AND i_B(3)) OR (NOT(i_A(3)) AND carry(2)) OR (i_B(3) AND carry(2));
        
        o_carryOut <= carry(3);
    END PROCESS;
    
END arch_fullSub;
