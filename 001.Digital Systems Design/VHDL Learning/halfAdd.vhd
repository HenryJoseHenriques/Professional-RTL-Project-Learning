-- Code your testbench here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY halfAdd IS
    PORT (
        i_A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        i_B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        o_S : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        o_TS : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
    );
END halfAdd;

ARCHITECTURE arch_halfAdd OF halfAdd IS
BEGIN
    PROCESS (i_A, i_B)
    BEGIN
        o_S <= (i_A XOR i_B);
        o_TS <= (i_A AND i_B);
    END PROCESS
END arch_halfAdd;