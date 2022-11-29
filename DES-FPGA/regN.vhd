----------------------------------------------------------------------------------
-------------------------------------N BIT REGISTER-------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity
entity regN is
    generic(n: positive);
    port(
        D: IN STD_LOGIC_VECTOR(n-1 downto 0);
        Q: OUT STD_LOGIC_VECTOR(n-1 downto 0);
        CLK, CLR, LOAD: IN STD_LOGIC
    );
end regN;

--architecture
architecture Behavioral of regN is
    --tmp signal
    signal tmp: STD_LOGIC_VECTOR(n-1 downto 0);
begin
    regN : process( CLK, LOAD, tmp )
    begin
        if (RISING_EDGE(CLK)) then
            if (CLR = '1') then
                tmp <= (others => '0');

            elsif(LOAD = '1') then
                tmp <= D;
            end if ;
            
        end if ;

        Q <= tmp;
        
    end process ; -- regN


end Behavioral;

