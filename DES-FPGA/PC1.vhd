----------------------------------------------------------------------------------
-----------------------------PERMUTATION-CHOICE-ONE-------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PC1 is
    port(
        INPUT: IN STD_LOGIC_VECTOR(63 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(55 downto 0)
    );
end PC1;

architecture Behavioral of PC1 is

     --internal signals
     type t_PC1 is array (0 to 55) of integer;
     signal r_PC1 : t_PC1 := (56, 48, 40, 32, 24, 16, 8,  0,  57, 49, 41, 33, 25, 17, 9, 1,  58, 50, 42, 34, 26, 18, 10, 2, 59, 51, 43, 35, 62, 54, 46, 38, 30, 22, 14, 6, 61, 53, 45, 37, 29, 21, 13, 5,  60, 52, 44, 36, 28, 20, 12, 4,  27, 19, 11, 3); --PC1 TABLE VALUES

begin
    PC1 : process(INPUT)
    begin
        for i in 0 to 55 loop
            OUTPUT(i) <= INPUT(r_PC1(i));
        end loop ; -- iterate
    end process ; -- PC1

end Behavioral;

