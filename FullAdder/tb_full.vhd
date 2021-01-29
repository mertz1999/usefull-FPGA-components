LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_fulladder IS
END tb_fulladder;

ARCHITECTURE behavior OF tb_fulladder IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT full_adder
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         cin : IN  std_logic;
         sum : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
	 
   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal cin : std_logic := '0';
	
 	--Outputs
   signal sum : std_logic;
   signal cout : std_logic;
	
BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
          a => a,
          b => b,
          cin => cin,
          sum => sum,
          cout => cout
        );
		  
   -- Stimulus process
   stim_proc: process
	variable count : std_logic_vector(2 downto 0) := "000";
   begin	
		while (count < "111") loop
		wait for 1 ns;
		count := count + 1;
		a <= count(0);
		b <= count(1);
		cin <= count(2);
		end loop;
		wait;
   end process;
	
END;
