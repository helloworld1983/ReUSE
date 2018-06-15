#########################################
# Copyright (C) 2016 Project Bonfire    #
#                                       #
# This file is automatically generated! #
#             DO NOT EDIT!              #
#########################################

vlib work

# Include files and compile them
vcom "/media/Data/workspace/Bonfire_project/Reuse/Packages/router_pack.vhd"
vcom "/media/Data/workspace/Bonfire_project/Reuse/RTL/base_line/arbiter_in.vhd"
vcom "/media/Data/workspace/Bonfire_project/Reuse/RTL/base_line/arbiter_out.vhd"
vcom "/media/Data/workspace/Bonfire_project/Reuse/RTL/base_line/allocator.vhd"
vcom "/media/Data/workspace/Bonfire_project/Reuse/RTL/base_line/LBDR.vhd"
vcom "/media/Data/workspace/Bonfire_project/Reuse/RTL/base_line/xbar.vhd"
vcom "/media/Data/workspace/Bonfire_project/Reuse/RTL/base_line/FIFO_one_hot_credit_based.vhd"
vcom "/media/Data/workspace/Bonfire_project/Reuse/RTL/base_line/NI.vhd"
vcom "/media/Data/workspace/Bonfire_project/Reuse/RTL/base_line/Router_32_bit_credit_based.vhd"
vcom "/media/Data/workspace/Bonfire_project/Reuse/Packages/TB_Package_32_bit_credit_based_NI.vhd"
vcom "network_4x4_credit_based.vhd"
vcom "network_4x4_Rand_credit_based_tb.vhd"

# Start the simulation
vsim work.tb_network_4x4

# Draw waves
do wave_4x4.do
# Run the simulation
vcd file wave.vcd
vcd add -r -optcells /*
run 12000 ns
vcd flush

# Exit Modelsim after simulation
exit
