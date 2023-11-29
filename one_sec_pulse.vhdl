library ieee;
use ieee.std_logic_1164.all;

entity one_sec_pulse is
  port (
    reset: in std_ulogic;
    clock: in std_ulogic;
    one_sec: inout std_ulogic
    );
end;

architecture rtl of one_sec_pulse is
begin
  process (reset, clock)
    variable c : integer := 0;
  begin
    if reset then
      one_sec <= '0';
    else
      if rising_edge(clock) then
        c := c + 1;
        if c = 20 then
          one_sec <= not one_sec;
          c := 0;
        end if;
      end if;
    end if;
  end process;
end;

