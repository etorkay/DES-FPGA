------------------------PERMUTED CHOICE 1--------------------------------
-----------USE TO CONVERT A 64-BIT KEY TO A 56-BIT-----------------------
-------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--the entity
entity PC_1 is
	port(	PC_IN : in std_logic_vector(63 downto 0);			--initialise PC-1 input
			PC_OUT : out std_logic_vector(55 downto 0));		--initialise PC-1 output
end PC_1;

--the architecture 
architecture Behavioral of PC_1 is

begin
	PC_OUT(0) <= PC_IN(56);				--bit assignment is done by discarding the 8th bits of the input
	PC_OUT(1) <= PC_IN(48);
	PC_OUT(2) <= PC_IN(40);
	PC_OUT(3) <= PC_IN(32);
	PC_OUT(4) <= PC_IN(24);
	PC_OUT(5) <= PC_IN(16);
	PC_OUT(6) <= PC_IN(8);
	PC_OUT(7) <= PC_IN(0);
	PC_OUT(8) <= PC_IN(57);
	PC_OUT(9) <= PC_IN(49);
	PC_OUT(10) <= PC_IN(41);
	PC_OUT(11) <= PC_IN(33);
	PC_OUT(12) <= PC_IN(25);
	PC_OUT(13) <= PC_IN(17);
	PC_OUT(14) <= PC_IN(9);
	PC_OUT(15) <= PC_IN(1);
	PC_OUT(16) <= PC_IN(58);
	PC_OUT(17) <= PC_IN(50);
	PC_OUT(18) <= PC_IN(42);
	PC_OUT(19) <= PC_IN(34);
	PC_OUT(20) <= PC_IN(26);
	PC_OUT(21) <= PC_IN(18);
	PC_OUT(22) <= PC_IN(10);
	PC_OUT(23) <= PC_IN(2);
	PC_OUT(24) <= PC_IN(59);
	PC_OUT(25) <= PC_IN(51);
	PC_OUT(26) <= PC_IN(43);
	PC_OUT(27) <= PC_IN(35);
	PC_OUT(28) <= PC_IN(62);
	PC_OUT(29) <= PC_IN(54);
	PC_OUT(30) <= PC_IN(46);
	PC_OUT(31) <= PC_IN(38);
	PC_OUT(32) <= PC_IN(30);
	PC_OUT(33) <= PC_IN(22);
	PC_OUT(34) <= PC_IN(14);
	PC_OUT(35) <= PC_IN(6);
	PC_OUT(36) <= PC_IN(61);
	PC_OUT(37) <= PC_IN(53);
	PC_OUT(38) <= PC_IN(45);
	PC_OUT(39) <= PC_IN(37);
	PC_OUT(40) <= PC_IN(29);
	PC_OUT(41) <= PC_IN(21);
	PC_OUT(42) <= PC_IN(13);
	PC_OUT(43) <= PC_IN(5);
	PC_OUT(44) <= PC_IN(60);
	PC_OUT(45) <= PC_IN(52);
	PC_OUT(46) <= PC_IN(44);
	PC_OUT(47) <= PC_IN(36);
	PC_OUT(48) <= PC_IN(28);
	PC_OUT(49) <= PC_IN(20);
	PC_OUT(50) <= PC_IN(12);
	PC_OUT(51) <= PC_IN(4);
	PC_OUT(52) <= PC_IN(27);
	PC_OUT(53) <= PC_IN(19);
	PC_OUT(54) <= PC_IN(11);
	PC_OUT(55) <= PC_IN(3);
	
end Behavioral;

