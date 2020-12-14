analyze -f vhdl -lib WORK ../src/MBE/constants.vhd
analyze -f vhdl -lib WORK ../src/MBE/Mux4to1.vhd
analyze -f vhdl -lib WORK ../src/MBE/MuxSel.vhd
analyze -f vhdl -lib WORK ../src/MBE/QjGen.vhd
analyze -f vhdl -lib WORK ../src/MBE/PPGen.vhd
analyze -f vhdl -lib WORK ../src/MBE/HA.vhd
analyze -f vhdl -lib WORK ../src/MBE/FA.vhd
analyze -f vhdl -lib WORK ../src/MBE/Dadda.vhd
analyze -f vhdl -lib WORK ../src/MBE/MBE.vhd

analyze -f vhdl -lib WORK ../src/fpnormalize_fpnormalize.vhd
analyze -f vhdl -lib WORK ../src/fpround_fpround.vhd
analyze -f vhdl -lib WORK ../src/packfp_packfp.vhd
analyze -f vhdl -lib WORK ../src/unpackfp_unpackfp.vhd
analyze -f vhdl -lib WORK ../src/regn.vhd
analyze -f vhdl -lib WORK ../src/regn0.vhd
analyze -f vhdl -lib WORK ../src/fpmul_single_cycle.vhd
analyze -f vhdl -lib WORK ../src/fpmul_stage1_struct.vhd
analyze -f vhdl -lib WORK ../src/fpmul_stage2_struct.vhd
analyze -f vhdl -lib WORK ../src/fpmul_stage3_struct.vhd
analyze -f vhdl -lib WORK ../src/fpmul_stage4_struct.vhd
analyze -f vhdl -lib WORK ../src/fpmul_pipeline.vhd

set power_preserve_rtl_hier_names true
elaborate FPmul -arch pipeline -lib WORK > ./elaborate.txt
create_clock -name MY_CLK -period 0 clk
set_dont_touch_network MY_CLK
set_clock_uncertainty 0.07 [get_clocks MY_CLK]
set_input_delay 0.5 -max -clock MY_CLK [remove_from_collection [all_inputs] clk]
set_output_delay 0.5 -max -clock MY_CLK [all_outputs]
set OLOAD [load_of NangateOpenCellLibrary/BUF_X4/A]
set_load $OLOAD [all_outputs]

#compile
#optimize_registers
compile_ultra
optimize_registers
report_resources > ./report_resources_ultra2.txt
report_timing > ./report_timing_ultra2.txt
report_area > ./report_area_ultra2.txt
