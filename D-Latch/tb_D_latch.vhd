LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;

ENTITY tb_D_Latch IS
--	GENERIC (tp : time := 3 ns;
--				th : time := 3 ns);
END tb_D_Latch;

ARCHITECTURE behavior OF tb_D_Latch IS 
    COMPONENT D_Latch
    PORT(
         clk, D : IN  std_logic;
         Q, notQ : OUT  std_logic);
    END COMPONENT;
	 
   signal clk, D : std_logic := '0';
   signal Q, notQ: std_logic;
	
   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
   constant tp : time := 3 ns;
   --constant th : time := 3 ns;
	
BEGIN

   circuit_under_test : D_Latch PORT MAP (D => D,clk => clk,Q => Q,notQ => notQ);
   
   clk_process : process
   begin
		clk <= '0';	
		wait for clk_period/2;	-- 5 ns
		clk <= '1';	
		wait for clk_period/2;	-- 5 ns
   end process;
	
	process
		variable err_Count : integer := 0;
	begin
		err_Count := 0;
		D <= '0';
		wait for tp;
		assert (Q = '0') report "0 not propagated" severity ERROR;
		if(Q /= '0') then
			err_Count := err_Count + 1;
		end if;
		D <= '1';
		wait for tp;
		assert (Q = '1') report "1 not propagated" severity ERROR;
		if(Q /= '1') then
			err_Count := err_Count + 1;
		end if;
		if(err_Count = 0) then
			assert false report "Good"	severity NOTE;
		else
			assert false report "Bad" severity ERROR;
		end if;
	end process;
	
END;
