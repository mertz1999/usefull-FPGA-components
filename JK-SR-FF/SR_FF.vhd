library ieee;
use ieee. std_logic_1164.all;

entity SR_FF is
	PORT(S,R,clk : in std_logic;
		  Q, QBAR : out std_logic);
end SR_FF;

architecture Behavioral of SR_FF is
begin
	process(clk)
		variable temp : std_logic;
	begin
		if (clk='1' and clk'event) then
			if (S='0' and R='0') then
				temp := temp;
			elsif (S='1' and R='1') then
				temp := 'Z';
			elsif (S='0' and R='1') then
				temp := '0';
			else
				temp := '1';
			end if;
		end if;
		Q <= temp;
		QBAR <= not temp;
	end PROCESS;
end Behavioral;
