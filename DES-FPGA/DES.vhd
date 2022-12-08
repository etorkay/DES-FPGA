----------------------------------------------------------------------------------
--------------------------------DES-FUNCTION-WITH-KEY-----------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity DES is
    port(
        DATA_INPUT: IN STD_LOGIC_VECTOR(0 to 63);
        KEY_INPUT: IN STD_LOGIC_VECTOR(0 to 63);

        --control signals
        muxSel, CLK, CLR, dLoad: IN STD_LOGIC;

        DATA_OUTPUT: OUT STD_LOGIC_VECTOR(0 to 63)

    );
end DES;


--architecture
architecture Structural of DES is
    --internal signals
	 signal ip_out : std_logic_vector(63 downto 0);
	 signal left_bit : std_logic_vector(31 downto 0);
	 signal right_bit : std_logic_vector(31 downto 0);
	 signal key_out : std_logic_vector(47 downto 0);
	 signal function_out : std_logic_vector(31 downto 0);
	 signal xor_out : std_logic_vector(31 downto 0);

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

    component COUNT 
        port(
            UP, CLK: IN STD_LOGIC;
            DONE: OUT STD_LOGIC;    --outputs 1 if count is 1111
            OUTPUT: OUT STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;



begin

    --port connection
    CNT0: COUNT port map(
        UP => ,
        CLK => CLK, 
        DONE => , 
        OUTPUT =>
    );

    IP1: IP port map(
        INPUT => DATA_INPUT ,
        OUTPUT => ip_out
    );

    MUXD1: MUX GENERIC MAP(32) port map(
        INPUT_0 => ip_out(63 downto 32), 
        INPUT_1 => right_bit,
        sel => muxSel ,
        OUTPUT => left_bit
    );
    MUXD2: MUX GENERIC MAP(32) port map(
        INPUT_0 => ip_out(31 downto 0), 
        INPUT_1 => xor_out,
        sel => muxSel,
        OUTPUT => right_bit
    );

    --REGD1: regN GENERIC MAP(32) port map(
    --    D => ,
    --    Q => ,
    --    CLK =>, 
    --    CLR => , 
    --    LOAD =>
    --);
    --REGD2: regN GENERIC MAP(32) port map(
    --    D => ,
    --    Q => ,
    --    CLK =>, 
    --    CLR => , 
    --    LOAD =>
    --);

    FUNCT0: FUNCT port map(
        INPUT => right_bit,
        KEY_IN => key_out,
        FUNCT_EN => '1',
        OUTPUT => function_out
    );
    KGEN0: KEY_GEN port map(
        INPUT => KEY_INPUT,
        muxSel => muxSel, 
        CLK => CLK, 
        rLoad =>, 
        CLR => CLR,
        schdl_sel => ,
        OUTPUT => key_out
    );
	 
	 
	 XORF: CUST_XOR GENERIC(32) port map(
		  INPUT1 => function_out,
		  INPUT2 => left_bit,
		  OUTPUT => xor_out
	 );




    FP1: FP port map(
        INPUT => left_bit & xor_out,
        OUTPUT => DATA_OUTPUT
    );





    

end Structural;

