LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;

ENTITY tb_ALU IS
END tb_ALU;

ARCHITECTURE behavior OF tb_ALU IS 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         ALU_Sel : IN  std_logic_vector(3 downto 0);
         ALU_Out : OUT  std_logic_vector(15 downto 0);
         Carryout : OUT  std_logic
        );
    END COMPONENT;
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal ALU_Sel : std_logic_vector(3 downto 0) := (others => '0');
   signal ALU_Out : std_logic_vector(15 downto 0);
   signal Carryout : std_logic;
	signal i : integer := 1;
BEGIN
   uut: ALU PORT MAP (
          A => A,
          B => B,
          ALU_Sel => ALU_Sel,
          ALU_Out => ALU_Out,
          Carryout => Carryout
        );
-- Stimulus process
process
	begin  
      -- hold reset state for 20 ns
      A <= x"000A";
		B <= x"0002";
		ALU_Sel <= x"0";	
		wait for 20 ns;
		
		for i in 1 to 15 loop 
			ALU_Sel <= ALU_Sel + x"1";
		wait for 20 ns;
		end loop;
		
		ALU_Sel <= x"0";	--Addition
		A <= x"FFFF";
		B <= x"0100";
		wait for 20 ns;
		ALU_Sel <= x"1";	--Subtraction
		A <= x"000A";
		B <= x"00F6";
		wait for 20 ns;
   wait;
end process;
END;

