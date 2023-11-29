library ieee;
use ieee.std_logic_1164.all;
use work.one_sec_pulse;

entity one_sec_tb is
end one_sec_tb;

architecture behaviour of one_sec_tb
is
  signal reset:         std_ulogic;
  signal clk:           std_ulogic;
  signal one_sec_sig:   std_ulogic;
  constant clk_period : time := 10 ns;
  constant iterations : integer := 250;
begin

  stimulus: process
  begin
    reset <= '1';
    clk   <= '0';
    wait for clk_period * 10;
    reset <= '0';
    wait for clk_period * 2;
    for i in 0 to iterations loop
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
    end loop;
    std.env.finish;
  end process;

  worker : entity one_sec_pulse
    port map(reset => reset, clock => clk, one_sec => one_sec_sig);
  
end behaviour;
