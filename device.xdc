set_property PACKAGE_PIN Y9 [get_ports clk]
set_property IOSTANDARD LVCMOS18 [get_ports clk]

create_clock -period 50.000 -name clk -waveform {0.000 25.000} [get_ports clk]
