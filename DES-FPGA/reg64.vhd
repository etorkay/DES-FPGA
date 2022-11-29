----------------------------------------------------------------------------------
-------------------------------------64 BIT REGISTER------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity
entity reg64 is
    port(
        D: IN STD_LOGIC_VECTOR(63 downto 0);
        Q: OUT STD_LOGIC_VECTOR(63 downto 0);
        CLK, CLR, LOAD: IN STD_LOGIC
    );
end reg64;

--architecture
architecture Behavioral of reg64 is
    --tmp signal
    signal tmp: STD_LOGIC_VECTOR(63 downto 0);
begin
    reg64 : process( CLK, LOAD, tmp )
    begin
        if (RISING_EDGE(CLK)) then
            if (CLR = '1') then
                tmp <= (others => '0');

            elsif(LOAD = '1') then
                tmp <= D;
            end if ;
            
        end if ;

        Q <= tmp;
        
    end process ; -- reg64

end Behavioral;

