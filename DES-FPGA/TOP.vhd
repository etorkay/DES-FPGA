----------------------------------------------------------------------------------
----------------------------------------TOP---------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity
entity TOP is
    port(
        DATA_INPUT: IN STD_LOGIC_VECTOR(63 downto 0);
        KEY_INPUT: IN STD_LOGIC_VECTOR(63 downto 0);
        CIPHER_OUT: OUT STD_LOGIC_VECTOR(63 downto 0);
        DONE: OUT STD_LOGIC;
        CLK, CLR: IN STD_LOGIC
    );
end TOP;

--architecture
architecture Structrual of TOP is
    --internal signals
    signal muxselsig, clrsig, upcountsig, functensig, keymuxselsig, keyloadsig, dataloadsig, tmpdonesig: STD_LOGIC;
    signal cntstatussig: STD_LOGIC_VECTOR(4 downto 0);

    --component declaration
    component PRE_TOP
        port(
            DATA_INPUT: IN STD_LOGIC_VECTOR(63 downto 0);
            KEY_INPUT: IN STD_LOGIC_VECTOR(63 downto 0);
    
            --control signals
            muxSel, CLK, CLR, dLoad, upCount, functEn, keyMuxSel, keyLoad, cudone: IN STD_LOGIC;
    
            --STATUS SIGNALS
            CNT_STATUS: OUT STD_LOGIC_VECTOR(4 downto 0);
    
            OUTPUT: OUT STD_LOGIC_VECTOR(63 downto 0)
        );
    end component;

    component CU
        port(
            CLK, CLR: IN STD_LOGIC;

            --CONTROL SIGNALS
            muxSel, clr_sig, upcount, functen, keymuxsel, keyload, dataload, doneSig: OUT STD_LOGIC;
    
            --STATUS SIGNALS
            CNT_STATUS: IN STD_LOGIC_VECTOR(4 downto 0)
        );
    end component;

begin
    CU0: CU port map(
        CLK => CLK, 
        CLR => CLR,

        --CONTROL SIGNALS
        muxSel => muxselsig, 
        clr_sig => clrsig, 
        upcount => upcountsig, 
        functen => functensig, 
        keymuxsel => keymuxselsig, 
        keyload => keyloadsig, 
        dataload => dataloadsig, 
        doneSig => tmpdonesig,

        --STATUS SIGNALS
        CNT_STATUS => cntstatussig
    );
		DONE <= tmpdonesig; -- done assertion from control unit seen at top level
	
    DP0: PRE_TOP port map(
        DATA_INPUT => DATA_INPUT,
        KEY_INPUT => KEY_INPUT,

        --control signals
        muxSel => muxselsig, 
        CLK => CLK, 
        CLR => clrsig, 
        dLoad => dataloadsig, 
        upCount => upcountsig, 
        functEn => functensig, 
        keyMuxSel => keymuxselsig, 
        keyLoad => keyloadsig,
        cudone => tmpdonesig,

        --STATUS SIGNALS
        CNT_STATUS => cntstatussig,

        OUTPUT => CIPHER_OUT
    );
    


end Structrual;

