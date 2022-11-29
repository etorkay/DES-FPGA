------------------the expansion box-------------------------------------------
----------this box extends a 32-bit input to a 48-bit output------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity E_box is
port(	E_in : in std_logic_vector(31 downto 0);		--initialise a 32-bit input
		E_out : out std_logic_vector(47 downto 0));	--initialise a 48-bit output
end E_box;

architecture Behavioral of E_box is

begin
	E_out(0) <= E_in(31);									--mapping of bits
	E_out(1) <= E_in(0);
	E_out(2) <= E_in(1);
	E_out(3) <= E_in(2);
	E_out(4) <= E_in(3);
	E_out(5) <= E_in(4);
	E_out(6) <= E_in(3);
	E_out(7) <= E_in(4);
	E_out(8) <= E_in(5);
	E_out(9) <= E_in(6);
	E_out(10) <= E_in(7);
	E_out(11) <= E_in(8);
	E_out(12) <= E_in(7);
	E_out(13) <= E_in(8);
	E_out(14) <= E_in(9);
	E_out(15) <= E_in(10);
	E_out(16) <= E_in(11);
	E_out(17) <= E_in(12);
	E_out(18) <= E_in(11);
	E_out(19) <= E_in(12);
	E_out(20) <= E_in(13);
	E_out(21) <= E_in(14);
	E_out(22) <= E_in(15);
	E_out(23) <= E_in(16);
	E_out(24) <= E_in(15);
	E_out(25) <= E_in(16);
	E_out(26) <= E_in(17);
	E_out(27) <= E_in(18);
	E_out(28) <= E_in(19);
	E_out(29) <= E_in(20);
	E_out(30) <= E_in(19);
	E_out(31) <= E_in(20);
	E_out(32) <= E_in(21);
	E_out(33) <= E_in(22);
	E_out(34) <= E_in(23);
	E_out(35) <= E_in(24);
	E_out(36) <= E_in(23);
	E_out(37) <= E_in(24);
	E_out(38) <= E_in(25);
	E_out(39) <= E_in(26);
	E_out(40) <= E_in(27);
	E_out(41) <= E_in(28);
	E_out(42) <= E_in(27);
	E_out(43) <= E_in(28);
	E_out(44) <= E_in(29);
	E_out(45) <= E_in(30);
	E_out(46) <= E_in(31);
	E_out(47) <= E_in(0);

end Behavioral;

