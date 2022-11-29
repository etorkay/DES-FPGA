----------------------------------------------------------------------------------
-----------------------------------------S-BOX------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--entity
entity S_BOX is
    port(
        INPUT: IN STD_LOGIC_VECTOR(5 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(3 downto 0)
    );
end S_BOX;

--architecture
architecture Behavioral of S_BOX is
    --temp signals
    signal row: STD_LOGIC_VECTOR(1 downto 0);
    signal col: STD_LOGIC_VECTOR(3 downto 0);
    signal sel: STD_LOGIC_VECTOR(5 downto 0);
    signal tmp: integer;

     --internal signals
    type t_SBOX is array (0 to 63) of integer;
    signal r_SBOX : t_SBOX := (14, 04, 13, 01, 02, 15, 11, 08, 03, 10, 06, 12, 05, 09, 00, 07, 00, 15, 07, 04, 14, 02, 13, 10, 03, 06, 12, 11, 09, 05, 03, 08, 04, 01, 14, 08, 13, 06, 02, 11, 15, 12, 09, 07, 03, 10, 05, 00, 15, 12, 08, 02, 04, 09, 01, 07, 05, 11, 03, 14, 10, 00, 06, 13); --S-box-1 values

begin
    row <= INPUT(5) & INPUT(0);	--index 5 and 0 concatenated
    col <= INPUT(4 downto 1);	--index 4 to 1 
    sel <= row & col;	--index rearranged to [5,0,1,2,3,4]
    tmp <= r_SBOX(to_integer(unsigned(sel))); --corresponding value retrieved at index
    
    OUTPUT <= std_logic_vector(to_unsigned(tmp, 4)); --value conveted back to std_logic_vector

end Behavioral;




