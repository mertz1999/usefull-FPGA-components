-------------------HALF ADDER----------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HA is	-- Half Adder
	port( a,b : in std_logic;
			sum, cout : out std_logic
		);
end HA;

architecture Behavior_HA of HA is
begin
	sum <= a XOR b;
	cout <= a AND b;
end Behavior_HA;