LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY multiplexer IS
	generic (n : integer := 4);
	port(
	 a : in std_logic_vector(n-1 downto 0); 
	 b : in std_logic_vector(n-1 downto 0); 
	 c : in std_logic_vector(n-1 downto 0); 
	 d : in std_logic_vector(n-1 downto 0); 
	 e : in std_logic_vector(n-1 downto 0);
	 sel : in std_logic_vector(2 downto 0); 
	 output: out std_logic_vector(n-1 downto 0)
	 );
END multiplexer;

ARCHITECTURE behavioral OF multiplexer IS
 BEGIN
	output <= a  WHEN sel="000" ELSE
		  b WHEN sel="001" ELSE
		  c WHEN sel="010" ELSE
		  d WHEN sel="011" ELSE
		  e WHEN sel="100" ELSE
		  (others => 'Z');
END behavioral;

