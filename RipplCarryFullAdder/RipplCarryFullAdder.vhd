library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ripple_Carry_Adder is
	generic(n : integer range 0 to 63 := 8);
	port(
			in1_r,in2_r : in std_logic_vector(n-1 downto 0);
			carry_in : in std_logic;
			carry_out : out std_logic;
			s : out std_logic_vector(n-1 downto 0)
			); 
end Ripple_Carry_Adder;

architecture structural of Ripple_Carry_Adder is

	component full_adder
		port (
		 in1, in2, cin  : in std_logic;
		 sum, cout   : out std_logic
		 );
	end component;

	signal c : std_logic_vector(n downto 0);

Begin

	gen : for i in 0 to n-1 generate
		u : full_adder port map(in1_r(i),in2_r(i),c(i),s(i),c(i+1));
		end generate;

	c(0) <= carry_in;
	carry_out <= c(n);
	
end structural;


