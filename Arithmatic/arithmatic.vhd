library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
--use IEEE.STD_LOGIC_signed.ALL; --This library extends the std_logic_arith library to handle std_logic_vector values as signed integers		
--use IEEE.STD_LOGIC_unsigned.ALL; --This library extends the std_logic_arith library to handle std_logic_vector values as unsigned integers
--use IEEE.numeric_std.ALL; use unsined or signed for signals

entity Arithmetic is
end Arithmetic;

architecture arith of Arithmetic is
signal r_mod, r_rem, r_mult, r_div, r_pow : integer;
signal mult : std_logic_vector(7 downto 0);
signal ma : std_logic_vector(3 downto 0) := "1011"; -- = 11 (unsigned) or = -5 (signed)
signal mb : std_logic_vector(3 downto 0) := "0011"; -- = 3
begin

r_mod  <= 5 mod 2; -- = 1
r_rem  <= 15 rem (-4); -- = 3
r_mult <= 5 * 7; -- = 35
r_div  <= (-20) / 3; -- = -6 = 1010
r_pow  <= 4 ** 4; -- = 256
mult <= signed(ma) * signed(mb); --depends on signed or unsigned declaration
--mult <= ma * mb; --depends on signed or unsigned declaration

end arith;
