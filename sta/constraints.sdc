create_clock -name vclk -period 5
set_input_delay 0 -clock vclk [all_inputs]
set_output_delay 0 -clock vclk [all_outputs]
set_load 0.01 [all_outputs]

