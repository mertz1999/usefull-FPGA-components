LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_Encoder IS
END tb_Encoder;

ARCHITECTURE behavior OF tb_Encoder IS 

    COMPONENT Encoder
    PORT(
         En : IN  std_logic;
         i : IN  std_logic_vector(3 downto 0);
         V : OUT  std_logic;
         Y0 : OUT  std_logic;
         Y1 : OUT  std_logic
        );
    END COMPONENT;
	 
   signal En_s : std_logic := '0';
   signal i_s : std_logic_vector(3 downto 0) := (others => '0');
   signal V_s : std_logic;
   signal Y0_s : std_logic;
   signal Y1_s : std_logic;
	signal temp_s : unsigned(3 downto 0) := "0001";
	
BEGIN

   uut: Encoder PORT MAP (En_s,i_s,V_s,Y0_s,Y1_s);
	
	process begin
		EN_s <= '0';
		i_s <= "0100";
		wait for 2 ns;
		En_s <= '1';
		i_s <= "1100";
		wait for 2 ns;
		En_s <= '1';
		for j in 1 to 4 loop
			i_s <= std_logic_vector(temp_s);	-- type conversion from temp_s to std_logic_vector
			temp_s <= temp_s SLL 1; 			-- temp_s*=2
			wait for 2 ns;
		end loop;
	wait;
	end process;
	
END;
