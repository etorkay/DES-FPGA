----------------------------------------------------------------------------------
-------------------------------------N-BIT-CUST_XOR------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity CUST_XOR is
    generic(n: positive);
    port(
        INPUT1, INPUT2: IN STD_LOGIC_VECTOR(n-1 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(n-1 downto 0)
    );
end CUST_XOR;

--architecture
architecture Behavioral of CUST_XOR is

begin
    OUTPUT <= INPUT1 XOR INPUT2;


end Behavioral;

