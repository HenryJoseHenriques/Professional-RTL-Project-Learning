library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity DADO is
port(
	i_face : in std_logic_vector(2 downto 0);
	o_L1 : out bit;
	o_L2 : out bit;
	o_L3 : out bit;
	o_L4 : out bit;
	o_L5 : out bit;
	o_L6 : out bit;
	o_L7 : out bit
);
end DADO;

architecture LED_DADO of DADO is
	signal X, Y : std_logic;
begin
	--X <= A or B;
	--Y <= A and B;
	process (i_face) 
	begin
		case i_face is	
			when "001" =>
				o_L1 <= "0";
				o_L2 <= "0";
				o_L3 <= "0";
				o_L4 <= "1";
				o_L5 <= "0";
				o_L6 <= "0";
				o_L7 <= "0";
			when "010" =>
				o_L1 <= "1";
				o_L2 <= "0";
				o_L3 <= "0";
				o_L4 <= "0";
				o_L5 <= "0";
				o_L6 <= "0";
				o_L7 <= "1";
			when "011" =>
				o_L1 <= "1";
				o_L2 <= "0";
				o_L3 <= "0";
				o_L4 <= "1";
				o_L5 <= "0";
				o_L6 <= "0";
				o_L7 <= "1";
			when "100" =>
				o_L1 <= "1";
				o_L2 <= "1";
				o_L3 <= "0";
				o_L4 <= "0";
				o_L5 <= "0";
				o_L6 <= "1";
				o_L7 <= "1";
			when "101" =>
				o_L1 <= "1";
				o_L2 <= "1";
				o_L3 <= "0";
				o_L4 <= "1";
				o_L5 <= "0";
				o_L6 <= "1";
				o_L7 <= "1";
			when "110" =>
				o_L1 <= "1";
				o_L2 <= "1";
				o_L3 <= "1";
				o_L4 <= "0";
				o_L5 <= "1";
				o_L6 <= "1";
				o_L7 <= "1";
			when others =>
				o_L1 <= "0";
				o_L2 <= "0";
				o_L3 <= "0";
				o_L4 <= "0";
				o_L5 <= "0";
				o_L6 <= "0";
				o_L7 <= "0";
		end case;
	end process;
end LED_DADO;
