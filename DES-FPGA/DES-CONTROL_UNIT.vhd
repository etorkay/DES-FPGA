-------------------------------------------------------------------------------------------
-------------------------------DES CONTROL UNIT--------------------------------------------
-------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CONTROL_UNIT is
	port(
		CLK, CLR : in std_logic;
		
		--control signals
		dLoad, kLoad, upCount, clrCount, muxSel, rLoad, outEn : out std_logic;
		
		--status signal from datapath
		counter : in std_logic_vector(4 downto 0)
		
	);
end CONTROL_UNIT;

architecture Structural of CONTROL_UNIT is
	type state_type is (ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7, ST8);
	signal PS, NS : state_type;
	signal controls : std_logic_vector(6 downto 0);

begin

	--control signals assignment to controls
	dLoad <= controls(6);
	kLoad <= controls(5);
	upCount <= controls(4);
	clrCount <= controls(3);
	muxSel <= controls(2);
	rLoad <= controls(1);
	outEn <= controls(0);
	
	--synchronous process
	sync_proc : process(CLK, CLR, NS)
	begin
		
		if (CLR = '1') then
			PS <= ST0;
		elsif (RISING_EDGE(CLK)) then
			PS <= NS;
		end if;
		
	end process sync_proc;
		
	--combinatory process
	comb_proc : process(PS, counter)
	begin
	
		case(PS) is 
		
			when ST0 => 
				controls <= "1101-00";
				NS <= ST1;
				
			when ST1 =>
				controls <= "0010-00";
--				if (counter = "00000") then
--					NS <= ST2;
--				elsif ( counter < "1111") then
--					NS <= ST3;
--				else
--					NS <= ST7;
--				end if;
				
				if(counter > "01111") then
					NS <= ST7;
				elsif(counter = "00000") then
					NS <= ST2;
				elsif(counter > "00000") then 
					NS <= ST3;
				end if;
					
			when ST2 =>
				controls <= "0000010";
				NS <= ST4;
				
			when ST3 =>
				controls <= "0000110";
				NS <= ST4;
				
			when ST4 =>
				controls <= "0000-00";		--wait state
				NS <= ST5;
				
			when ST5 =>
				controls <= "0000-00";		--wait state
				NS <= ST6;
				
			when ST6 =>
				controls <= "0000-00";		--wait state
				NS <= ST1;
				
			when ST7 =>
				controls <= "0000-00";		--wait state
				NS <= ST8;
				
			when ST8 =>
				controls <= "0000-01";
				if (CLR = '1') then
					NS <= ST0;
				else
					NS <= ST8;
				end if;
				
			when others =>
				NS <= ST0;
		end case;
	
	end process comb_proc;

end Structural;

