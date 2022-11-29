----------------------------------------------------------------------------------
----------------------------------INITIAL PERMUTATION-----------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity IP is
    port(
        INPUT: IN STD_LOGIC_VECTOR(63 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(63 downto 0)
    );
end IP;


--architecture
architecture Behavioral of IP is
    --internal signals
    type t_IP is array (0 to 63) of integer;
    signal r_IP : t_IP := (57,49,41,33,25,17,9,1,59,51,43,35,27,19,11,3,61,53,45,37,29,21,13,5,63,55,47,39,31,23,15,7,56,48,40,32,24,16,8,0,58,50,42,34,26,18,10,2,60,52,44,36,28,20,12,4,62,54,46,38,30,22,14,6);

begin

    IP : process(INPUT)
    begin
        for i in 0 to 63 loop
            OUTPUT(i) <= INPUT(r_IP(i));
        end loop ; -- iterate
        
    end process ; -- IP

end Behavioral;




