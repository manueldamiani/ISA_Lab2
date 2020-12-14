library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity data_save is
  port (
    CLK   : in std_logic;
    DIN   : in std_logic_vector(31 downto 0));
end data_save;

architecture beh of data_save is

begin  -- beh

  process (CLK)
    file res_fp : text open WRITE_MODE is "./fp_prod.hex";
    variable ptr : line;    
  begin  -- process
    if(CLK'event and CLK = '1') then  -- rising clock edge
        hwrite(ptr, DIN);
        writeline(res_fp, ptr);
    end if;
  end process;

end beh;
