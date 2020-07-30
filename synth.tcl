# Run this by typing:
#
#   vivado -mode batch -source synth.tcl
#
# Then see the resource utilization (i.e., area) report dumped at:
#
#   out/FutilBuild.runs/synth_1/main_utilization_synth.rpt
#
# And if you also do implementation (see below), see the timing report:
#
#   out/FutilBuild.runs/impl_1/main_timing_summary_routed.rpt

# Settings: the output directory and the part number (which is a Zynq
# XC7Z020, found on our ZedBoard).
set outdir ./out
set partname xc7z020clg484-1

# Create the project (forcibly overwriting) and add sources SystemVerilog
# (*.sv) and Xilinx constraint files (*.xdc), which contain directives for
# connecting design signals to physical FPGA pins.
create_project -force -part xc7z020clg484-1 FutilBuild $outdir
add_files [glob ./*.sv]
add_files -fileset constrs_1 [glob ./*.xdc]
set_property top main [current_fileset]

# Create an "out-of-context" fileset that synthesizes a module in isolation.
create_fileset -blockset -define_from main myooc

# Run synthesis. This is enough to generate the utilization report mentioned
# above but does not include timing information.
launch_runs myooc_synth_1
wait_on_run myooc_synth_1
