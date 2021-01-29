--------   Library and Packages   -----------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--------   Interface or Entity   ------------
entity Encoder is
	port( 
		En : in std_logic;
		--i0, i1, i2, i3 : in std_logic;
		i : in std_logic_vector(3 downto 0);
		V, Y0, Y1 : out std_logic
		);
end Encoder;
--------   Architecture or Body  ------------
architecture Behavioral of Encoder is
	signal A, B, C, D : std_logic := '0';
begin

	A <= i(0) and not i(1) and not i(2) and not i(3);
	B <= i(1) and not i(0) and not i(2) and not i(3);
	C <= i(2) and not i(0) and not i(1) and not i(3);
	D <= i(3) and not i(0) and not i(1) and not i(2);
	Y0 <= En and (B or D);
	Y1 <= En and (C or D);
	V <= En and (A or B or C or D);
	
end Behavioral;

