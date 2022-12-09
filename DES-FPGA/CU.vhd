----------------------------------------------------------------------------------
-----------------------------------CONTROL-UNIT-----------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity CU is
    port(
        CLK, CLR: IN STD_LOGIC;

        --CONTROL SIGNALS
        muxSel, clr_sig, upcount, functen, keymuxsel, keyload, dataload, doneSig: OUT STD_LOGIC;

        --STATUS SIGNALS
        CNT_STATUS: IN STD_LOGIC_VECTOR(4 downto 0)

    );
end CU;

--architecture
architecture Behavioral of CU is
    type state_type is (ST0, ST1, ST2, ST3, ST4, ST5);
    signal PS, NS: state_type;
    signal controls: STD_LOGIC_VECTOR(6 downto 0);

begin
    muxSel <= controls(6);
    clr_sig <= controls(5);
    upcount <= controls(4);
    functen <= controls(3);
    keymuxsel <= controls(2);
    keyload <= controls(1);
    dataload <= controls(0);


    --synchrounous process
    sync_proc : process(CLK, CLR, NS)
    begin

        --async input
        if (CLR = '1') then
            PS <= ST0;
        elsif(RISING_EDGE(CLK)) then
            PS <= NS;
        end if ;
        
    end process ; -- sync_proc

    --combiniatory process
    comb_proc : process(PS, CLR, CNT_STATUS)
    begin
        case(PS) is
        
            when ST0 =>
                controls <= "0100000";
                if (CLR = '0') then
                    NS <= ST1;
                else
                    NS <= ST0;
                end if ;

            when ST1 =>
                controls <= "0000010";
                NS <= ST2;

            when ST2 =>
                controls <= "0011001";
                NS <= ST3;

            when ST3 =>
                controls <= "1000110";
                NS <= ST4;

            when ST4 =>
                controls <= "1011101";
                if (CNT_STATUS < "10001") then
                    NS <= ST3;
                else
                    doneSig <= '1';
                    NS <= ST5;
                end if ;
                
            when ST5 =>
                controls <= "-100-00";
                NS <= ST5;

            when others =>
                controls <= "0000000";
                NS <= ST0;
        
        end case ;
        
    end process ; -- comb_proc


end Behavioral;

