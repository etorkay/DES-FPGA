----------------------------------------------------------------------------------
---------------------------------------PRE_TOP----------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity PRE_TOP is
    port(
        DATA_INPUT: IN STD_LOGIC_VECTOR(63 downto 0);
        KEY_INPUT: IN STD_LOGIC_VECTOR(63 downto 0);

        --control signals
        muxSel, CLK, CLR, dLoad, upCount, functEn, keyMuxSel, keyLoad, cudone: IN STD_LOGIC;

        --STATUS SIGNALS
        CNT_STATUS: OUT STD_LOGIC_VECTOR(4 downto 0);

        OUTPUT: OUT STD_LOGIC_VECTOR(63 downto 0)

    );
end PRE_TOP;

--architecture
architecture Structural of PRE_TOP is
--internal signals
signal ip_out, pre_output, tmp_output, pre_fp_out: STD_LOGIC_VECTOR(63 downto 0);
signal l_mux_out, r_mux_out: STD_LOGIC_VECTOR(31 downto 0);
signal round_num: STD_LOGIC_VECTOR(4 downto 0);
signal key_out: STD_LOGIC_VECTOR(47 downto 0);
signal l_reg_out, r_reg_out, funct_out, xor_out: STD_LOGIC_VECTOR(31 downto 0);
signal donesig: STD_LOGIC;

--component declaration
component IP
    port(
        INPUT: IN STD_LOGIC_VECTOR(63 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(63 downto 0)
    );
end component;

component FP
    port(
        INPUT: IN STD_LOGIC_VECTOR(63 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(63 downto 0)
    );
end component;

component MUX
    generic(n: positive);
    port(
        --INPUT
        INPUT_0, INPUT_1: IN STD_LOGIC_VECTOR(n-1 downto 0);
        --SEL SIGNAL
        sel: IN STD_LOGIC;
        --OUTPUT
        OUTPUT: OUT STD_LOGIC_VECTOR(n-1 downto 0)
    );
end component;

component regN
      generic(n: positive);
    port(
        D: IN STD_LOGIC_VECTOR(n-1 downto 0);
        Q: OUT STD_LOGIC_VECTOR(n-1 downto 0);
        CLK, CLR, LOAD: IN STD_LOGIC
    );
end component;

component CUST_XOR
    generic(n: positive);
    port(
        INPUT1, INPUT2: IN STD_LOGIC_VECTOR(n-1 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(n-1 downto 0)
    );
end component;

component FUNCT
    port(
        INPUT: IN STD_LOGIC_VECTOR(31 downto 0);
        KEY_IN: IN STD_LOGIC_VECTOR(47 downto 0);
        FUNCT_EN: IN STD_LOGIC; 
        OUTPUT: OUT STD_LOGIC_VECTOR(31 downto 0)
    );
end component;

component KEY_GEN
port(
    INPUT: IN STD_LOGIC_VECTOR(63 downto 0);

    --control signals
    muxSel, CLK, rLoad, CLR: IN STD_LOGIC;
    schdl_sel: IN STD_LOGIC_VECTOR(4 downto 0);


    OUTPUT: OUT STD_LOGIC_VECTOR(47 downto 0)
);
end component;

component COUNT 
    port(
        UP, CLK, CLR: IN STD_LOGIC;
        DONE: OUT STD_LOGIC;    --outputs 1 if count is 1111
        OUTPUT: OUT STD_LOGIC_VECTOR(4 downto 0)
    );
end component;



begin

--port connection
CNT0: COUNT port map(
    UP => upCount, 
    CLK => CLK, 
    CLR => CLR,
    DONE => doneSig, 
    OUTPUT => round_num
);

IP1: IP port map(
    INPUT => DATA_INPUT,
    OUTPUT => ip_out
);

MUXD1: MUX GENERIC MAP(32) port map(    --left register
    INPUT_0 => ip_out(63 downto 32), 
    INPUT_1 => r_reg_out,
    sel => muxSel, --muxSel = 0 selects initial input, muxSel = 1 selects interetive input
    OUTPUT => l_mux_out
);
MUXD2: MUX GENERIC MAP(32) port map(    --right register
    INPUT_0 => ip_out(31 downto 0), 
    INPUT_1 => xor_out,
    sel => muxSel,  --muxSel = 0 selects initial input, muxSel = 1 selects interetive input
    OUTPUT => r_mux_out
);

REGD1: regN GENERIC MAP(32) port map(
    D => l_mux_out,
    Q => l_reg_out,
    CLK => CLK, 
    CLR => CLR, 
    LOAD => dLoad
);
REGD2: regN GENERIC MAP(32) port map(
    D => r_mux_out,
    Q => r_reg_out,
    CLK => CLK, 
    CLR => CLR, 
    LOAD => dLoad
);

XORD: CUST_XOR GENERIC MAP(32) port map(
    INPUT1 => funct_out, 
    INPUT2 => l_reg_out,
    OUTPUT => xor_out

);

FUNCT0: FUNCT port map(
    INPUT => r_reg_out,
    KEY_IN => key_out,
    FUNCT_EN => functEn,
    OUTPUT => funct_out
);

KGEN0: KEY_GEN port map(
    INPUT => KEY_INPUT,
    muxSel => keyMuxSel,     --muxSel of KEY_GEN, select 0 for first operation, 1 afterwards
    CLK => CLK, 
    rLoad => keyLoad, 
    CLR => CLR,
    schdl_sel => round_num,
    OUTPUT => key_out
);


pre_output <= l_reg_out & funct_out;
CNT_STATUS <= round_num;
pre_fp_out <= r_reg_out & l_reg_out;

with cudone SELECT OUTPUT <= tmp_output when '1',
                            (others => 'Z') when others;


FP1: FP port map(   --concatenated after last round
    INPUT => pre_fp_out,
    OUTPUT => tmp_output
);

end Structural;

