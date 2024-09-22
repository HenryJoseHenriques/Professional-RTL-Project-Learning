LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY and4bits IS
    PORT (
        i_A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        i_B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        o_S : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END and4bits;

ARCHITECTURE arch_and4bits OF and4bits IS
BEGIN
    o_S <= i_A AND i_B;
END arch_and4bits;