library ieee;
use ieee.std_logic_1164.all;

entity clk_gen is
	port( CLK: out std_logic);
end clk_gen;

architecture bhv of clk_gen is

	constant Ts: time := 10 ns;
	signal CLK_i: std_logic;

begin
	
	process
	begin
		if(CLK_i = 'U') then
			CLK_i <= '0';
		else
			CLK_i <= not(CLK_i);
		end if;
		wait for Ts/2;
	end process;

	CLK <= CLK_i;

end bhv;
