library ieee;
use ieee.std_logic_1164.all;

entity regn is
	port( D: in std_logic_vector(31 downto 0);
		  CLK: in std_logic;
		  Q: out std_logic_vector(31 downto 0));
end regn;

architecture bhv of regn is

begin
	reg_proc: process(CLK)
		begin
			if(CLK = '1' AND CLK'event) then
				Q <= D;
			end if;
	end process reg_proc;

end bhv;
