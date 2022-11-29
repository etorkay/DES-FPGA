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
     type t_PC2 is array (0 to 47) of integer;
     signal r_PC2 : t_PC2 := (14, 17, 11, 24, 1,5, 3, 28, 15, 6, 21, 10, 23, 19, 12, 4, 26, 8, 16, 7, 27, 20, 13, 2, 41, 52, 31, 37, 47, 55, 30, 40, 51, 45, 33, 48, 44, 49, 39, 56, 34, 53, 46, 42, 50, 36, 29, 32); --PC2 TABLE VALUES

begin
    PC2 : process(INPUT)
    begin
        for i in 0 to 47 loop
            OUTPUT(i) <= INPUT(r_PC2(i));
        end loop ; -- iterate
    end process ; -- PC2

end Behavioral;


--This PC2 implementation is not complet