-------------------FULL ADDER-----------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is	-- Full Adder
	port(in1, in2, cin : in std_logic;
		  sum, cout : out std_logic
		 );
end full_adder;

architecture Behavior_FA of full_adder is

	COMPONENT HA 
		PORT( a,b : in std_logic;
			sum, cout : out std_logic
			 );
	END COMPONENT;
	
	signal HA1_HA2, CO1_OR, CO2_OR : std_logic;
	
begin

	U1 : HA PORT MAP (in1,in2,HA1_HA2,CO1_OR);
	U2 : HA PORT MAP (HA1_HA2,cin,sum,CO2_OR);
	
	cout <= CO1_OR OR CO2_OR;
	
end Behavior_FA;

