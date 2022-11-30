----------------------------------------------------------------------------------
----------------------------------CIRCULAR-LEFT-SHIFT-----------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity CLS is
    port(
        INPUT: IN STD_LOGIC_VECTOR(27 downto 0);
        LEN: IN STD_LOGIC_VECTOR(1 downto 0);
        OUTPUT: OUT STD_LOGIC_VECTOR(27 downto 0)
    );
end CLS;

--architecture
architecture Behavioral of CLS is
    --internal signals
    signal tmp_one: STD_LOGIC; --holds 1-BIT shifted bit
    signal tmp_two: STD_LOGIC_VECTOR(1 downto 0);   --holds 2-BIT shifted bits
    

begin
        
    tmp_one <= INPUT(27);
    tmp_two <= INPUT(27 downto 26);
    with LEN select OUTPUT <= INPUT(26 downto 0) & tmp_one when "01",	--left circular shift one bit
                              INPUT(25 downto 0) & tmp_two when "10",	--left circular shift two bits
                              (others => 'Z') when others;


end Behavioral;

