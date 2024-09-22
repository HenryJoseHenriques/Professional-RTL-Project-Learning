LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY increm IS
    PORT (
        i_A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        i_carryIn : IN STD_LOGIC;
        o_S : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        o_carryOut : OUT STD_LOGIC
    );
END increm;

ARCHITECTURE arch_increm OF increm IS

    SIGNAL carry : STD_LOGIC_VECTOR (3 DOWNTO 0);
BEGIN
    -- Soma bit 0
    o_S(0) <= i_A(0) XOR i_carryIn;
    carry(0) <= (i_A(0) AND i_carryIn);

    -- Soma bit 1
    o_S(1) <= i_A(1) XOR carry(0);
    carry(1) <= (i_A(1) AND carry(0));

    -- Soma bit 2
    o_S(2) <= i_A(2) XOR carry(1);
    carry(2) <= (i_A(2) AND carry(1));

    -- Soma bit 3
    o_S(3) <= i_A(3) XOR carry(2);
    carry(3) <= (i_A(3) AND carry(2));

    -- Carry out
    o_carryOut <= carry(3);

END arch_increm;