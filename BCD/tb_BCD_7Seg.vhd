LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
--USE ieee.numeric_std.ALL;

ENTITY tb_BCD_7seg IS
END tb_BCD_7seg;

ARCHITECTURE behavior OF tb_BCD_7seg IS 
    COMPONENT BCD_7seg
    PORT(
         BCD_input : IN  std_logic_vector(3 downto 0);
         to_LED : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
   signal BCD_input_s : std_logic_vector(3 downto 0) := (others => '0');
   signal to_LED_s : std_logic_vector(6 downto 0);
BEGIN

   uut: BCD_7seg PORT MAP (BCD_input => BCD_input_s,to_LED => to_LED_s);
		  
--BCD_input_s <= "0001" after 5 ns, "0010" after 10 ns, "0011" after 15 ns,
--				 "0100" after 20 ns, "0101" after 25 ns, "0110" after 30 ns,
--				 "0111" after 35 ns, "1000" after 40 ns, "1001" after 45 ns,
--				 "1010" after 50 ns, "1011" after 55 ns, "1100" after 60 ns,
--				 "1101" after 65 ns, "1110" after 70 ns, "1111" after 75 ns;

process 
variable c : integer range 0 to 15 := 0;
begin
	wait for 5 ns;  
	c := c + 1;
	BCD_input_s <= conv_std_logic_vector(c,4);
	if (c = 15) then 
	wait;	-- waits forever 
	end if;
end process;

END;
