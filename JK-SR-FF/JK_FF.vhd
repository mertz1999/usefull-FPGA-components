library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FF is
port( J, K, rst, clk, clk_en : in  std_logic;
      output : out std_logic);
end JK_FF;

architecture Behavioral of JK_FF is
	-- if we defin ouptput por as buffer we don`t need temp signal 
   signal temp : std_logic;	--see line 24
begin
   process (clk) 	--synchronous reset
   begin
		if (clk'event and clk='1') then
      --if rising_edge(Clock) then   
         if rst='1' then   
            temp <= '0';
         elsif clk_en ='1' then
            if (J='0' and K='0') then
               temp <= temp;
            elsif (J='0' and K='1') then
               temp <= '0';
            elsif (J='1' and K='0') then
               temp <= '1';
            elsif (J='1' and K='1') then
               temp <= not (temp);
            end if;
         end if;
      end if;
   end process;
	
	output <= temp;
	
end Behavioral;
