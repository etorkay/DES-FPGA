----------------------------------------------------------------------------------
--------------------------------DES-FUNCTION-WITH-KEY-----------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity DES is
    port(
        DATA_INPUT: IN STD_LOGIC_VECTOR(63 downto 0);
        KEY_INPUT: IN STD_LOGIC_VECTOR(63 downto 0);

        --control signals
        muxSel, CLK, CLR, dLoad: IN STD_LOGIC;

        DATA_OUTPUT: OUT STD_LOGIC_VECTOR(63 downto 0)

    );
end DES;


--architecture
architecture Structural of DES is
    --internal signals

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
        port(
            D: IN STD_LOGIC_VECTOR(63 downto 0);
            Q: OUT STD_LOGIC_VECTOR(63 downto 0);
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
        schdl_sel: IN STD_LOGIC_VECTOR(3 downto 0);


        OUTPUT: OUT STD_LOGIC_VECTOR(47 downto 0)
    );
    end component;

    --component COUNT --todo: IMPLEMENT COUNTER
    --end component;



begin

    --port connection
    --CNT0: COUNT port map();
    IP1: IP port map(
        INPUT => ,
        OUTPUT =>
    );

    MUXD1: MUX GENERIC MAP(32) port map(
            INPUT_0 => , 
            INPUT_1 => ,
            sel => ,
            OUTPUT =>
    );
    MUXD2: MUX GENERIC MAP(32) port map(
        INPUT_0 => , 
        INPUT_1 => ,
        sel => ,
        OUTPUT =>
    );

    REGD1: regN GENERIC MAP(32) port map();
    REGD2: regN GENERIC MAP(32) port map();

    FUNCT0: FUNCT port map(
        INPUT => ,
        KEY_IN => ,
        FUNCT_EN => ,
        OUTPUT =>
    );
    KGEN0: KEY_GEN port map(
        INPUT => ,
        muxSel => , 
        CLK => , 
        rLoad =>, 
        CLR => ,
        schdl_sel => ,
        OUTPUT => 
    );




    FP1: FP port map(
        INPUT => ,
        OUTPUT =>
    );





    

end Structural;

