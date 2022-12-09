----------------------------------------------------------------------------------
-----------------------PRIMITIVE-32-BIT-PERMUTATION-TABLE-------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity
entity PERM_PRIM is
    port(
        INPUT: IN STD_LOGIC_VECTOR(0 to 31);
        OUTPUT: OUT STD_LOGIC_VECTOR(0 to 31)
    );
end PERM_PRIM;

--architecture
architecture Behavioral of PERM_PRIM is

    --internal signals
    type t_PERM_PRIM is array (0 to 31) of integer; --adjusted for 0th utilization
    signal r_PERM_PRIM : t_PERM_PRIM := (15, 6, 19, 20, 28, 11, 27, 16, 0,  14, 22, 25, 4, 17, 30, 9, 1,  7,  23, 13, 31, 26, 2,  8, 18, 12, 29, 5,  21, 10, 3,  24); --PRIMITIVE 32 BIT PERMUTATION TABLE VALUES

begin
    PERM_PRIM : process(INPUT)
    begin
        for i in 0 to 31 loop
            OUTPUT(i) <= INPUT(r_PERM_PRIM(i));
        end loop ; -- iterate
    end process ; -- PERM_PRIM

end Behavioral;

