open_project myproj.prj -reset

set_top myfunc
add_files mycode.c

open_solution "solution1"
set_part xc7z020clg484-1
create_clock -period 7

csynth_design

exit
