# Run this with `vivado -mode batch -source synth.tcl`.
# Then see report at `out/FutilBuild.runs/synth_1/main_utilization_synth.rpt`.

# Settings: the output directory and the part number (which is a Zynq
# XC7Z020, found on our ZedBoard).
set outdir ./out
set partname xc7z020clg484-1

# Create the project (forcibly overwriting) and add SystemVerilog sources.
create_project -force -part xc7z020clg484-1 FutilBuild $outdir
add_files [glob ./*.sv]
set_property top main [current_fileset]

# Run synthesis. This is enough to generate the utilization report mentioned
# above but does not include timing information.
launch_runs synth_1
wait_on_run synth_1

# Run implementation to generate bitstream.
set_property STEPS.PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
