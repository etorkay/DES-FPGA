----------------------------------------------------------------------------------
----------------------------------KEY-SCHEDULING-TABLE----------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity
entity KEY_SCHDL is
    port(
        SEL: IN STD_LOGIC_VECTOR(3 downto 0);
        CLK: IN STD_LOGIC;
        OUTPUT: OUT STD_LOGIC_VECTOR(1 downto 0)
    );
end KEY_SCHDL;

--architecture
architecture Behavioral of KEY_SCHDL is

begin                                         
    -- with SEL select OUTPUT <=   "01" when "0000",   --adjusted for 0th utilization
    --                             "01" when "0001",
    --                             "10" when "0010",
    --                             "10" when "0011",
    --                             "10" when "0100",
    --                             "10" when "0101",
    --                             "10" when "0110",
    --                             "10" when "0111",
    --                             "01" when "1000",
    --                             "10" when "1001",
    --                             "10" when "1010",
    --                             "10" when "1011",
    --                             "10" when "1100",
    --                             "10" when "1101",
    --                             "10" when "1110",
    --                             "01" when "1111",
    --                             (others => 'Z') when others;

    keyschdl : process(CLK)
    begin
        if (RISING_EDGE(CLK)) then
            case(SEL) is
                when "0000" =>
                    OUTPUT <=   "01";
                when "0001" =>
                    OUTPUT <=   "01";
                when "0010" =>
                    OUTPUT <=   "10";
                when "0011" =>
                    OUTPUT <=   "10";
                when "0100" =>
                    OUTPUT <=   "10";
                when "0101" =>
                    OUTPUT <=   "10";
                when "0110" =>
                    OUTPUT <=   "10";
                when "0111" =>
                    OUTPUT <=   "10";
                when "1000" =>
                    OUTPUT <=   "01";
                when "1001" =>
                    OUTPUT <=   "10";
                when "1010" =>
                    OUTPUT <=   "10";
                when "1011" =>
                    OUTPUT <=   "10";
                when "1100" =>
                    OUTPUT <=   "10";
                when "1101" =>
                    OUTPUT <=   "10";
                when "1110" =>
                    OUTPUT <=   "10";
                when "1111" =>
                    OUTPUT <=   "01";
                when others =>
                    OUTPUT <= (others => 'Z');
            
            end case ;
            
        end if ;
        
    end process ; -- keyschdl


end Behavioral;

