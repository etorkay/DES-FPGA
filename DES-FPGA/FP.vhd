----------------------------------------------------------------------------------
----------------------------------FINAL PERMUTATION-----------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity FP is
    port(
        INPUT: IN STD_LOGIC_VECTOR(63 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(63 downto 0)
    );
end FP;

--architecture
architecture Behavioral of FP is
    --internal signals
    type t_FP is array (0 to 63) of integer;
    signal r_FP : t_FP := (39,7,47,15,55,23,63,31,38,6,46,14,54,22,62,30,37,5,45,13,53,21,61,29,36,4,44,12,52,20,60,28,35,3,43,11,51,19,59,27,34,2,42,10,50,18,58,26,33,1,41,9,49,17,57,25,32,0,40,8,48,16,56,24); --FP TABLE VALUES

begin
    FP : process(INPUT)
    begin
        for i in 0 to 63 loop
            OUTPUT(i) <= INPUT(r_FP(i));
        end loop ; -- iterate
        
    end process ; -- FP


end Behavioral;

