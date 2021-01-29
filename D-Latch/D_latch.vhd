library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_Latch is
	port(clk, D : in std_logic;
        Q, notQ : out std_logic);
end D_Latch;

architecture Behavioral of D_Latch is
	signal top, bot, Qback, notQback : std_logic;
begin
	top <= D NAND clk;
	bot <= top NAND clk;
	Qback <= top NAND notQback;
	notQback <= Qback NAND bot;
	Q <= Qback;
	notQ <= notQback;
end Behavioral;

