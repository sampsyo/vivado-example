# Settings: the output directory and the part number (which is a Zynq
# XC7Z020, found on our ZedBoard).
set outdir ./out
set partname xc7z020clg484-1

# Create the project (forcibly overwriting) and add Verilog sources.
create_project -force -part xc7z020clg484-1 FutilBuild $outdir
add_files [glob ./*.v]
set_property top main [current_fileset]

# Run synthesis.
launch_runs synth_1
wait_on_run synth_1
