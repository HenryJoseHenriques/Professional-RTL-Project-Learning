LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY or4bits IS
    PORT (
        i_A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        i_B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        o_S : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END or4bits;

ARCHITECTURE arch_or4bits OF or4bits IS
BEGIN   
    o_S <= i_A OR i_B;
END arch_or4bits;