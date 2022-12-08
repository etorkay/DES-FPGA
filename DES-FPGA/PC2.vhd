----------------------------------------------------------------------------------
-----------------------------PERMUTATION-CHOICE-TWO-------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PC2 is
    port(
        INPUT: IN STD_LOGIC_VECTOR(55 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(47 downto 0)
    );
end PC2;

architecture Behavioral of PC2 is

     --internal signals
     type t_PC2 is array (47 downto 0) of integer;
     signal r_PC2 : t_PC2 := (13, 16, 10, 23, 0,4, 2, 27, 14, 5, 20, 9, 22, 18, 11, 3, 25, 7, 15, 6, 26, 19, 12, 1, 40, 51, 30, 36, 46, 54, 29, 39, 50, 44, 32, 47, 43, 48, 38, 55, 33, 52, 45, 41, 49, 35, 28, 31); --PC2 TABLE VALUES

begin
    PC2 : process(INPUT)
    begin
        for i in 47 downto 0 loop
            OUTPUT(i) <= INPUT(r_PC2(i));
        end loop ; -- iterate
    end process ; -- PC2

end Behavioral;


--This PC2 implementation is not complet