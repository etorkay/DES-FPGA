----------------------------------------------------------------------------------
-----------------------------------------N-BIT-MUX--------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity MUX is
    generic(n: positive);
    port(
        --INPUT
        INPUT_0, INPUT_1: IN STD_LOGIC_VECTOR(n-1 downto 0);
        --SEL SIGNAL
        sel: IN STD_LOGIC;
        --OUTPUT
        OUTPUT: OUT STD_LOGIC_VECTOR(n-1 downto 0)
    );
end MUX;

--architecture
architecture Behavioral of MUX is

begin
    with sel select OUTPUT <= INPUT_0 when '0', 
                    INPUT_1 when '1', 
                    (others => 'Z') when others; --2 by 1 multiplexer

end Behavioral;

