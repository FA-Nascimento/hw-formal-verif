# ----------------------------------------
#  Copyright (c) 2017 Cadence Design Systems, Inc. All Rights
#  Reserved.  Unpublished -- rights reserved under the copyright 
#  laws of the United States.
# ----------------------------------------

# Analyze design under verification files
set ROOT_PATH "/users/francisco.nascimento/courses/FuncionalVerificationOfDigitalSystems/HomeWorks/Tarefa02/vendingmachine/versao4" 
set RTL_PATH ${ROOT_PATH}/design
set PROP_PATH ${ROOT_PATH}/properties

analyze -vhdl \
  ${RTL_PATH}/t4.vhd

# Analyze property files
analyze -sva \
  ${PROP_PATH}/bindings.sva \
  ${PROP_PATH}/v_t4.sva


# Elaborate design and properties
elaborate -vhdl -top sanduba(maquina)

# Set up Clocks and Resets
clock clock
reset {reset = "0"}

# Get design information to check general complexity
get_design_info

# Prove properties
# 1st pass: Quick validation of properties with default engines
set_max_trace_length 10
prove -all
#
# 2nd pass: Validation of remaining properties with different engines
set_max_trace_length 50
set_prove_per_property_time_limit 30s
set_engine_mode {K I N} 
prove -all

# Report proof results
report

