----------------------------------------------------------------------------------
---------------------------------KEY-GENERATION-BLOCK-----------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity KEY_GEN is
    port(
        INPUT: IN STD_LOGIC_VECTOR(63 downto 0);

        --control signals
        muxSel, CLK, rLoad, CLR: IN STD_LOGIC;
        schdl_sel: IN STD_LOGIC_VECTOR(3 downto 0);


        OUTPUT: OUT STD_LOGIC_VECTOR(47 downto 0)
    );
end KEY_GEN;


--architecture
architecture Structural of KEY_GEN is
    --internal signals
    signal pc_one_out, pc_two_in: STD_LOGIC_VECTOR(55 downto 0);
    signal mux_out: STD_LOGIC_VECTOR(55 downto 0);
    signal reg_one_out: STD_LOGIC_VECTOR(27 downto 0);
    signal reg_two_out: STD_LOGIC_VECTOR(27 downto 0);
    signal left_cls: STD_LOGIC_VECTOR(27 downto 0);
    signal right_cls: STD_LOGIC_VECTOR(27 downto 0);
    signal schdl_out: STD_LOGIC_VECTOR(1 downto 0);


    --component declaration
    component PC_1
        port(
            PC_IN: IN STD_LOGIC_VECTOR(0 to 63);
            PC_OUT: OUT STD_LOGIC_VECTOR(0 to 55)
        );
    end component;

    component PC2_ALT
        port(
            INPUT: IN STD_LOGIC_VECTOR(0 to 55);
            OUTPUT: OUT STD_LOGIC_VECTOR(0 to 47)
        );
    end component;

    component CLS
        port(
            INPUT: IN STD_LOGIC_VECTOR(27 downto 0);
            LEN: IN STD_LOGIC_VECTOR(1 downto 0);
            CLK: IN STD_LOGIC;
            OUTPUT: OUT STD_LOGIC_VECTOR(27 downto 0)
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

    component KEY_SCHDL
        port(
            SEL: IN STD_LOGIC_VECTOR(3 downto 0);
            CLK: IN STD_LOGIC;
            OUTPUT: OUT STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

begin
    --bundled connection
    pc_two_in <= left_cls & right_cls;

    --port connection
    PCONE: PC_1 port map(
        PC_IN => INPUT,
        PC_OUT => pc_one_out
    );  --PC one

    MUXK: MUX GENERIC MAP(56) port map(
        INPUT_0 => pc_one_out, 
        INPUT_1 => pc_two_in,
        sel => muxSel,
        OUTPUT => mux_out
    );


    REGK1: regN GENERIC MAP(28) port map(
        D => mux_out(55 downto 28),
        Q => reg_one_out,
        CLK => CLK, 
        CLR => CLR, 
        LOAD => rLoad 
    );

    REGK2: regN GENERIC MAP(28) port map(
        D => mux_out(27 downto 0),
        Q => reg_two_out,
        CLK => CLK, 
        CLR => CLR, 
        LOAD => rLoad
    );


    CLSL: CLS port map(
        INPUT => reg_one_out,
        LEN => schdl_out,
        CLK => CLK, 
        OUTPUT => left_cls
    );

    CLSR: CLS port map(
        INPUT => reg_two_out,
        LEN => schdl_out,
        CLK => CLK,
        OUTPUT => right_cls
    );
    

    KSCH: KEY_SCHDL port map(
        SEL => schdl_sel,
        CLK => CLK,
        OUTPUT => schdl_out
    );


    PCTWO: PC2_ALT port map(
        INPUT => pc_two_in,
        OUTPUT => OUTPUT    --outputs key for round
    ); --PC 2


end Structural;



    -- CLSL: CLS port map(
    --     INPUT => mux_out(55 downto 28),
    --     LEN => schdl_out,
    --     OUTPUT => left_cls
    -- );

    -- CLSR: CLS port map(
    --     INPUT => mux_out(27 downto 0),
    --     LEN => schdl_out,
    --     OUTPUT => right_cls
    -- );