----------------------------------------------------------------------------------
---------------------------PC2-ALTERNATIVE-IMPLEMENTATION-------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--entity
entity PC2_ALT is
    port(
        INPUT: IN STD_LOGIC_VECTOR(0 to 55);
        OUTPUT: OUT STD_LOGIC_VECTOR(0 to 47)
    );
end PC2_ALT;

--architecture
architecture Behavioral of PC2_ALT is

begin
    OUTPUT(0) <= INPUT(13);				--bit assignment is done by discarding the 8th bits of the input
	OUTPUT(1) <= INPUT(16);
	OUTPUT(2) <= INPUT(10);
	OUTPUT(3) <= INPUT(23);
	OUTPUT(4) <= INPUT(0);
	OUTPUT(5) <= INPUT(4);
	OUTPUT(6) <= INPUT(2);
	OUTPUT(7) <= INPUT(27);
	OUTPUT(8) <= INPUT(14);
	OUTPUT(9) <= INPUT(5);
	OUTPUT(10) <= INPUT(20);
	OUTPUT(11) <= INPUT(9);
	OUTPUT(12) <= INPUT(22);
	OUTPUT(13) <= INPUT(18);
	OUTPUT(14) <= INPUT(11);
	OUTPUT(15) <= INPUT(3);
	OUTPUT(16) <= INPUT(25);
	OUTPUT(17) <= INPUT(7);
	OUTPUT(18) <= INPUT(15);
	OUTPUT(19) <= INPUT(6);
	OUTPUT(20) <= INPUT(26);
	OUTPUT(21) <= INPUT(19);
	OUTPUT(22) <= INPUT(12);
	OUTPUT(23) <= INPUT(1);
	OUTPUT(24) <= INPUT(40);
	OUTPUT(25) <= INPUT(51);
	OUTPUT(26) <= INPUT(30);
	OUTPUT(27) <= INPUT(36);
	OUTPUT(28) <= INPUT(46);
	OUTPUT(29) <= INPUT(54);
	OUTPUT(30) <= INPUT(29);
	OUTPUT(31) <= INPUT(39);
	OUTPUT(32) <= INPUT(50);
	OUTPUT(33) <= INPUT(44);
	OUTPUT(34) <= INPUT(32);
	OUTPUT(35) <= INPUT(47);
	OUTPUT(36) <= INPUT(43);
	OUTPUT(37) <= INPUT(48);
	OUTPUT(38) <= INPUT(38);
	OUTPUT(39) <= INPUT(55);
	OUTPUT(40) <= INPUT(33);
	OUTPUT(41) <= INPUT(52);
	OUTPUT(42) <= INPUT(45);
	OUTPUT(43) <= INPUT(41);
	OUTPUT(44) <= INPUT(49);
	OUTPUT(45) <= INPUT(35);
	OUTPUT(46) <= INPUT(28);
	OUTPUT(47) <= INPUT(31);


end Behavioral;

