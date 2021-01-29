--------   Library and Packages   -----------
library ieee;
use ieee.std_logic_1164.all;
--------   Interface or Entity   ------------
entity full_adder is
  port (
    a, b, cin  : in std_logic;
    sum, cout   : out std_logic
    );
end full_adder;
--------   Architecture or Body  ------------
architecture Gate_Level of full_adder is
  signal axb, axbncin, anb : std_logic;
begin

  --axb <= a xor b;
  --axbncin <= axb and cin;
  --anb <= a and b;
  --sum   <= axb xor cin;
  --cout <= axbncin or anb;

  sum <= a xor b xor cin;
  cout <= (a and b) or ((a xor b) and cin);
	
  --cout <= (a AND b) OR (a AND cin) OR (b AND cin);
  
end Gate_Level;