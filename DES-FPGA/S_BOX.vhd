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
        SBOX_SEL: IN STD_LOGIC_VECTOR(2 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(3 downto 0)
    );
end S_BOX;

--architecture
architecture Behavioral of S_BOX is
    --temp signals
    signal row: STD_LOGIC_VECTOR(1 downto 0);
    signal col: STD_LOGIC_VECTOR(3 downto 0);
    signal sel: STD_LOGIC_VECTOR(5 downto 0);
    signal tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8: integer;

     --internal signals
    type t_SBOX is array (0 to 63) of integer;
    signal r_SBOX1 : t_SBOX := (14, 04, 13, 01, 02, 15, 11, 08, 03, 10, 06, 12, 05, 09, 00, 07, 00, 15, 07, 04, 14, 02, 13, 10, 03, 06, 12, 11, 09, 05, 03, 08, 04, 01, 14, 08, 13, 06, 02, 11, 15, 12, 09, 07, 03, 10, 05, 00, 15, 12, 08, 02, 04, 09, 01, 07, 05, 11, 03, 14, 10, 00, 06, 13); --S-box-1 values
    signal r_SBOX2 : t_SBOX := (15, 1,  8,  14, 6,  11, 3, 4,  9,  7,  2,  13, 12, 0,  5,  10, 3,  13, 4,  7, 15, 2,  8,  14, 12, 0, 1,  10, 6,  9,  11, 5,  0, 14, 7,  11, 10, 4,  13,  1,  5,  8,  12, 6,  9,  3, 2,  15, 13, 8,  10, 1, 3,  15, 4,  2,  11, 6,  7, 12, 0,  5,  14, 9); --S-box-2 values
    signal r_SBOX3 : t_SBOX := (10, 0,  9,  14, 6,  3, 15, 5,  1,  13, 12, 7,  11, 4,  2,  8,  13, 7,  0,  9,  3,  4, 6,  10, 2,  8,  5,  14, 12, 11, 15, 1,  13, 6,  4,  9,  8,  15, 3,  0,  11, 1,  2, 12, 5, 10, 14, 7,  1,  10, 13, 0,  6, 9,  8, 7, 4,  15, 14, 3,  11, 5,  2,  12); --S-box-3 values
    signal r_SBOX4 : t_SBOX := (7,  13, 14, 3,  0,  6,  9,  10, 1,  2, 8,  5,  11, 12, 4,  15, 13, 8,  11, 5,  6,  15, 0, 3,  4,  7, 2,  12, 1,  10, 14, 9,  10, 6,  9,  0, 12, 11, 7, 13, 15, 1,  3,  14, 5,  2,  8,  4,  3, 15, 0,  6, 10, 1,  13, 8,  9,  4,  5,  11, 12, 7, 2,  14); --S-box-4 values

    signal r_SBOX5 : t_SBOX := (2,  12, 4, 1,  7,  10, 11, 6, 8,  5,  3,  15, 13, 0,  14, 9, 14, 11, 2,  12, 4, 7,  13, 1,  5,  0, 15, 10, 3, 9,  8,  6,  4,  2, 1,  11, 10, 13, 7, 8,  15, 9, 12, 5,  6,  3,  0, 14, 11, 8,  12, 7, 1,  14, 2, 13, 6,  15, 0,  9, 10, 4,  5,  3); --S-box-5 values
    signal r_SBOX6 : t_SBOX := (12, 1,  10, 15, 9,  2,  6,  8,  0,  13, 3, 4, 14, 7,  5,  11, 10, 15, 4,  2,  7,  12, 9,  5, 6, 1, 13, 14, 0,  11, 3,  8,  9,  14, 15, 5,  2, 8, 12, 3,  7,  0,  4,  10, 1,  13, 11, 6,  4,  3, 2, 12, 9,  5,  15, 10, 11, 14, 1,  7,  6,  0,  8, 13); --S-box-6 values
    signal r_SBOX7 : t_SBOX := (4,  11, 2,  14, 15, 0,  8, 13, 3,  12, 9,  7,  5, 10, 6,  1,  13, 0,  11, 7, 4,  9,  1,  10, 14, 3, 5,  12, 2,  15, 8,  6,  1, 4,  11, 13, 12, 3,  7, 14, 10, 15, 6,  8,  0,  5, 9,  2,  6,  11, 13, 8, 1,  4,  10, 7,  9,  5,  0, 15, 14, 2,  3,  12); --S-box-7 values
    signal r_SBOX8 : t_SBOX := (13, 2,  8, 4,  6,  15, 11, 1,  10, 9, 3, 14, 5, 0,  12, 7, 1,  15, 13, 8,  10, 3,  7, 4, 12, 5, 6,  11, 0, 14, 9,  2,  7,  11, 4,  1, 9, 12, 14, 2,  0,  6, 10, 13, 15, 3,  5,  8,  2, 1, 14, 7, 4,  10, 8, 13, 15, 12, 9,  0,  3,  5, 6, 11); --S-box-8 values

begin
    row <= INPUT(5) & INPUT(0);	--index 5 and 0 concatenated
    col <= INPUT(4 downto 1);	--index 4 to 1 
    sel <= row & col;	--index rearranged to [5,0,1,2,3,4]

    tmp1 <= r_SBOX1(to_integer(unsigned(sel))); --corresponding value retrieved at index
    tmp2 <= r_SBOX2(to_integer(unsigned(sel))); --corresponding value retrieved at index
    tmp3 <= r_SBOX3(to_integer(unsigned(sel))); --corresponding value retrieved at index
    tmp4 <= r_SBOX4(to_integer(unsigned(sel))); --corresponding value retrieved at index

    tmp5 <= r_SBOX5(to_integer(unsigned(sel))); --corresponding value retrieved at index
    tmp6 <= r_SBOX6(to_integer(unsigned(sel))); --corresponding value retrieved at index
    tmp7 <= r_SBOX7(to_integer(unsigned(sel))); --corresponding value retrieved at index
    tmp8 <= r_SBOX8(to_integer(unsigned(sel))); --corresponding value retrieved at index
    
    with SBOX_SEL SELECT OUTPUT <=  std_logic_vector(to_unsigned(tmp1, 4)) when "000", --value conveted back to std_logic_vector
                                    std_logic_vector(to_unsigned(tmp2, 4)) when "001",
                                    std_logic_vector(to_unsigned(tmp3, 4)) when "010",
                                    std_logic_vector(to_unsigned(tmp4, 4)) when "011",

                                    std_logic_vector(to_unsigned(tmp5, 4)) when "100",
                                    std_logic_vector(to_unsigned(tmp6, 4)) when "101",
                                    std_logic_vector(to_unsigned(tmp7, 4)) when "110",
                                    std_logic_vector(to_unsigned(tmp8, 4)) when "111",
                                    (others => 'Z') when others;

end Behavioral;




