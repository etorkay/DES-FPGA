----------------------------------------------------------------------------------
------------------------------------DES-FUNCTION----------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity FUNCT is
    port(
        INPUT: IN STD_LOGIC_VECTOR(31 downto 0);
        KEY_IN: IN STD_LOGIC_VECTOR(47 downto 0);
        FUNCT_EN: IN STD_LOGIC; 
        OUTPUT: OUT STD_LOGIC_VECTOR(31 downto 0)
    );
end FUNCT;


--architecture
architecture Structural of FUNCT is
    --internal signals
    signal exp_out: STD_LOGIC_VECTOR(47 downto 0);
    signal xor_one_out: STD_LOGIC_VECTOR(47 downto 0);
    signal sbox_one_out, sbox_two_out, sbox_three_out, sbox_four_out, sbox_five_out, sbox_six_out, sbox_sev_out, sbox_eight_out: STD_LOGIC_VECTOR(3 downto 0);
    signal sbox_out, perm_32_out: STD_LOGIC_VECTOR(31 downto 0);

    --component declaration
    component EXP_BOX
        port(
            INPUT: IN STD_LOGIC_VECTOR(31 downto 0);
            OUTPUT: OUT STD_LOGIC_VECTOR(47 downto 0)
        );
    end component;

    component S_BOX
        port(
            INPUT: IN STD_LOGIC_VECTOR(5 downto 0);
            SBOX_SEL: IN STD_LOGIC_VECTOR(2 downto 0);  --select sbox number
            OUTPUT: OUT STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component PERM_PRIM
        port(
            INPUT: IN STD_LOGIC_VECTOR(31 downto 0);
            OUTPUT: OUT STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    component CUST_XOR
        generic(n: positive);
        port(
            INPUT1, INPUT2: IN STD_LOGIC_VECTOR(n-1 downto 0);
            OUTPUT: OUT STD_LOGIC_VECTOR(n-1 downto 0)
        );
    end component;

begin


    EBOX1: EXP_BOX port map(
        INPUT => INPUT,
        OUTPUT => exp_out
    );

    XOR1: CUST_XOR GENERIC MAP(48) port map(
        INPUT1 => exp_out, 
        INPUT2 => KEY_IN,
        OUTPUT => xor_one_out
    );

    SBOX1: S_BOX port map(
        INPUT => xor_one_out(47 downto 42),
        SBOX_SEL => "000",  --select sbox number
        OUTPUT => sbox_one_out
    );
    SBOX2: S_BOX port map(
        INPUT => xor_one_out(41 downto 36),
        SBOX_SEL =>  "001",  --select sbox number
        OUTPUT => sbox_two_out
    );
    SBOX3: S_BOX port map(
        INPUT => xor_one_out(35 downto 30),
        SBOX_SEL => "010",  --select sbox number
        OUTPUT => sbox_three_out
    );
    SBOX4: S_BOX port map(
        INPUT => xor_one_out(29 downto 24),
        SBOX_SEL => "011",  --select sbox number
        OUTPUT => sbox_four_out
    );

    SBOX5: S_BOX port map(
        INPUT => xor_one_out(23 downto 18),
        SBOX_SEL => "100",  --select sbox number
        OUTPUT => sbox_five_out
    );
    SBOX6: S_BOX port map(
        INPUT => xor_one_out(17 downto 12),
        SBOX_SEL => "101",  --select sbox number
        OUTPUT => sbox_six_out
    );
    SBOX7: S_BOX port map(
        INPUT => xor_one_out(11 downto 6),
        SBOX_SEL => "110",  --select sbox number
        OUTPUT => sbox_sev_out
    );
    SBOX8: S_BOX port map(
        INPUT => xor_one_out(5 downto 0),
        SBOX_SEL => "111",  --select sbox number
        OUTPUT => sbox_eight_out
    );

    sbox_out <= sbox_one_out & sbox_two_out & sbox_three_out & sbox_four_out & sbox_five_out & sbox_six_out & sbox_sev_out & sbox_eight_out; --sbox signal concatenated

    PERM32: PERM_PRIM port map(
        INPUT => sbox_out,
        OUTPUT => perm_32_out
    );

    with FUNCT_EN SELECT OUTPUT <= perm_32_out when '1',
                                (others => 'Z') when others;
    


end Structural;

