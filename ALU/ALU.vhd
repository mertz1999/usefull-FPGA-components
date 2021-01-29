library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity ALU is
  generic(constant shift_no : natural := 1; --number of shited or rotated bits
			 constant width : natural := 16);
  Port(A, B : in  STD_LOGIC_VECTOR(width-1 downto 0); 
       ALU_SEL : in  STD_LOGIC_VECTOR(3 downto 0);  -- 16 tasks
       ALU_OUT : out  STD_LOGIC_VECTOR(width-1 downto 0); 
       Carryout : out std_logic);  -- Carryout flag
end ALU; 

architecture Behavioral of ALU is
	signal Result : std_logic_vector (width-1 downto 0);
begin

process(A, B, ALU_SEL) --PAY ATTENTION TO THE INPUTS
	variable temp: std_logic_vector (width downto 0);
begin
	temp := (others => '0');
	CASE(ALU_SEL) IS
		WHEN "0000" => -- Addition
			temp := ('0' & A) + ('0' & B);
			Result <= temp(width-1 downto 0); 
		WHEN "0001" => -- Subtraction
			temp := ('0' & A) - ('0' & B);
			Result <= temp(width-1 downto 0); 
		WHEN "0010" => -- Multiplication
			Result <= std_logic_vector(to_unsigned((to_integer(unsigned(A)) * to_integer(unsigned(B))),width));
		WHEN "0011" => -- Division
			Result <= std_logic_vector(to_unsigned(to_integer(unsigned(A)) / to_integer(unsigned(B)),width));
		WHEN "0100" => -- Logical shift left
			Result <= std_logic_vector(unsigned(A) sll shift_no);
		WHEN "0101" => -- Logical shift right
			Result <= std_logic_vector(unsigned(A) srl shift_no);
		WHEN "0110" => -- Rotate left
			Result <= std_logic_vector(unsigned(A) rol shift_no);
		WHEN "0111" => -- Rotate right
			Result <= std_logic_vector(unsigned(A) ror shift_no);
		WHEN "1000" => -- Logical and 
			Result <= A and B;
		WHEN "1001" => -- Logical or
			Result <= A or B;
		WHEN "1010" => -- Logical xor 
			Result <= A xor B;
		WHEN "1011" => -- Logical nor
			Result <= A nor B;
		WHEN "1100" => -- Logical nand 
			Result <= A nand B;
		WHEN "1101" => -- Logical xnor
			Result <= A xnor B;
		WHEN "1110" => -- Greater comparison
			if(A>B) then
				Result <= (others => '1') ;
			else
				Result <= (others => '0') ;
			end if; 
		WHEN "1111" => -- Equal comparison   
			if(A=B) then
				Result <= (others => '1') ;
			else
				Result <= (others => '0') ;
			end if;
		WHEN OTHERS => Result <= (others => 'X'); 
	END CASE;
	Carryout <= temp(width); -- Carryout flag
end process;

	ALU_OUT <= Result; -- ALU out
	
end Behavioral;

