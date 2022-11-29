----------------------------------------------------------------------------------
------------------------------EXPANSION-PERMUTATION-BOX---------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity EXP_BOX is
    port(
        INPUT: IN STD_LOGIC_VECTOR(31 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(47 downto 0)
    );
end EXP_BOX;


--architecture
architecture Behavioral of EXP_BOX is

     --internal signals
     type t_EXP_BOX is array (0 to 47) of integer;
     signal r_EXP_BOX : t_EXP_BOX := (31, 0,  1,  2,  3,  4,  3,  4,  5,  6,  7,  8, 7,  8, 9, 10, 11, 12, 11, 12, 13, 14, 15, 16, 15, 16, 17, 18, 19, 20, 19, 20, 21, 22, 23, 24, 23, 24, 25, 26, 27, 28, 27, 28, 29, 30, 31, 0 ); --expansion value

begin
    EXP_BOX : process(INPUT)
    begin
        for i in 0 to 47 loop

            OUTPUT(i) <= INPUT(r_EXP_BOX(i));   --selects expansion value from array
            
        end loop ; -- iterate

    end process ; -- EXP_BOX


end Behavioral;

