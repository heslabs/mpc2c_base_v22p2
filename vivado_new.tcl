
set PRJ $::env(PRJ)
set BD $::env(BD)

create_project ${PRJ} ./ -part xcvu19p-fsva3824-2-e

# constrs_1 is the default folder
add_files -fileset constrs_1 ./top.xdc
#add_files ../../source/rtl

import_files -force

## Create block diagram from tcl
source ./top.tcl

## Generate wrapper file for block diagram
make_wrapper -files [get_files ./${PRJ}.srcs/sources_1/bd/$BD/${BD}.bd] -top -testbench -force

## Set wrapper as top
add_files -norecurse ./${PRJ}.gen/sources_1/bd/$BD/hdl/${BD}_wrapper.v
set_property top ${BD}_wrapper [current_fileset]

## Validate the design
validate_bd_design -force

exit

~       
