LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY not4bits IS
    PORT (
        i_A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        o_S : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END not4bits;

ARCHITECTURE arch_not4bits OF not4bits IS
BEGIN
    o_S <= NOT(i_A);
END arch_not4bits;