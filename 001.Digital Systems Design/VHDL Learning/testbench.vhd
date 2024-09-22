--ESSE TESTBENCH FOI FEITO PELO CHATGPT, ESTUDE-O

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY tb_fullAdd IS
END tb_fullAdd;

ARCHITECTURE behavior OF tb_fullAdd IS

    -- Component instantiation of the 4-bit adder (DUT)
    COMPONENT fullAdd
        PORT (
            i_A        : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
            i_B        : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
            i_carryIn  : IN  STD_LOGIC;
            o_S        : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            o_carryOut : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Signals to connect to the Device Under Test (DUT)
    SIGNAL A        : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL B        : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL carryIn  : STD_LOGIC := '0';
    SIGNAL S        : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL carryOut : STD_LOGIC;

BEGIN
    -- Instantiate the fullAdd component
    uut: fullAdd
        PORT MAP (
            i_A        => A,
            i_B        => B,
            i_carryIn  => carryIn,
            o_S        => S,
            o_carryOut => carryOut
        );

    -- Test process
    PROCESS
    BEGIN
        -- Test case 1: A = 3, B = 5, carryIn = 0
        A <= "0011";
        B <= "0101";
        carryIn <= '0';
        WAIT FOR 10 ns;
        
        -- Test case 2: A = 15, B = 1, carryIn = 0
        A <= "1111";
        B <= "0001";
        carryIn <= '0';
        WAIT FOR 10 ns;

        -- Test case 3: A = 7, B = 8, carryIn = 1
        A <= "0111";
        B <= "1000";
        carryIn <= '1';
        WAIT FOR 10 ns;

        -- Test case 4: A = 9, B = 6, carryIn = 0
        A <= "1001";
        B <= "0110";
        carryIn <= '0';
        WAIT FOR 10 ns;

        -- Stop the simulation
        WAIT;
    END PROCESS;

END behavior;
