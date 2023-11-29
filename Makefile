all:
	ghdl -a --std=08 one_sec_pulse.vhdl 
	ghdl -a --std=08 one_sec_tb.vhdl 
	ghdl -e --std=08 one_sec_tb 
	ghdl -r --std=08 one_sec_tb --wave=wave.ghw
