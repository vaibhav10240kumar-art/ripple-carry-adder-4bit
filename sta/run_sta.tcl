read_liberty sta/sky130_tt.lib
read_verilog sta/netlist.v
link_design ripple_carry_adder_4bit
read_sdc sta/constraints.sdc

report_checks -path_delay max -format full -digits 3
report_worst_slack -max
report_checks -path_delay max -to [get_ports cout] -digits 3
