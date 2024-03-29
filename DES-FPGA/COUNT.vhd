----------------------------------------------------------------------------------
---------------------------------SYNC-UP-COUNTER---------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


--entity
entity COUNT is
    port(
        UP, CLK, CLR: IN STD_LOGIC;
        DONE: OUT STD_LOGIC;    --outputs 1 if count is 1111
        OUTPUT: OUT STD_LOGIC_VECTOR(4 downto 0)
    );
end COUNT;

--architecture
architecture Behavioral of COUNT is
    --temp signals
    signal tmp: integer:= 0;

begin
    --synchronous upcounter
    count : process(CLK, CLR, tmp)
    begin
		
            if (RISING_EDGE(CLK)) then

                if (CLR = '1') then
                    tmp <= 0;

                else
                    
                    if (UP = '1') then
                        if(tmp = 17) then
                            tmp <= tmp;
                            DONE <= '1';
                        else
                            tmp <= tmp + 1;
                        end if;
                    else
                        tmp <= tmp;
                    end if ;

                end if;
            
        end if ;

        OUTPUT <= std_logic_vector(to_unsigned(tmp, 5));
    end process ; -- count



end Behavioral;

