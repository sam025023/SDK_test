
################################################################
# This is a generated script based on design: design_top_level
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2014.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_top_level_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z020clg400-1
#    set_property BOARD_PART em.avnet.com:microzed_7020:part0:1.0 [current_project]


# CHANGE DESIGN NAME HERE
set design_name design_top_level

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}


# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: Zynq_Processing_System
proc create_hier_cell_Zynq_Processing_System { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_Zynq_Processing_System() - Empty argument(s)!"
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:can_rtl:1.0 CAN_0
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR
  create_bd_intf_pin -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC_0
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M01_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M02_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M03_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI

  # Create pins
  create_bd_pin -dir O -type clk FCLK_CLK0
  create_bd_pin -dir I -from 0 -to 0 In0
  create_bd_pin -dir I -from 0 -to 0 In1
  create_bd_pin -dir I -from 0 -to 0 In2
  create_bd_pin -dir O -from 0 -to 0 -type rst S00_ARESETN
  create_bd_pin -dir I dcm_locked
  create_bd_pin -dir I -type clk slowest_sync_clk

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list CONFIG.NUM_MI {4}  ] $axi_interconnect_0

  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]
  set_property -dict [ list CONFIG.NUM_MI {1}  ] $axi_interconnect_1

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list CONFIG.PCW_CAN0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_EN_CLK0_PORT {1} CONFIG.PCW_EN_CLK1_PORT {0} \
CONFIG.PCW_EN_CLK2_PORT {0} CONFIG.PCW_EN_CLK3_PORT {0} \
CONFIG.PCW_EN_CLKTRIG0_PORT {0} CONFIG.PCW_EN_RST0_PORT {1} \
CONFIG.PCW_EN_RST1_PORT {0} CONFIG.PCW_EN_RST2_PORT {0} \
CONFIG.PCW_EN_RST3_PORT {0} CONFIG.PCW_FCLK0_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_FCLK1_PERIPHERAL_CLKSRC {IO PLL} CONFIG.PCW_FCLK2_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_FCLK3_PERIPHERAL_CLKSRC {IO PLL} CONFIG.PCW_FCLK_CLK0_BUF {true} \
CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ {33.333333} CONFIG.PCW_FPGA3_PERIPHERAL_FREQMHZ {50} \
CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {1} CONFIG.PCW_GPIO_EMIO_GPIO_IO {1} \
CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {0} CONFIG.PCW_I2C0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_IRQ_F2P_INTR {1} CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_USE_FABRIC_INTERRUPT {1} CONFIG.PCW_USE_M_AXI_GP0 {1} \
CONFIG.PCW_USE_S_AXI_HP0 {1} CONFIG.preset {Microzed*} \
 ] $processing_system7_0

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list CONFIG.NUM_PORTS {3}  ] $xlconcat_0

  # Create interface connections
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins S00_AXI] [get_bd_intf_pins axi_interconnect_1/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins M00_AXI] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins M01_AXI] [get_bd_intf_pins axi_interconnect_0/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins M02_AXI] [get_bd_intf_pins axi_interconnect_0/M02_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M03_AXI [get_bd_intf_pins M03_AXI] [get_bd_intf_pins axi_interconnect_0/M03_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins axi_interconnect_1/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net processing_system7_0_CAN_0 [get_bd_intf_pins CAN_0] [get_bd_intf_pins processing_system7_0/CAN_0]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_pins DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_pins FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_IIC_0 [get_bd_intf_pins IIC_0] [get_bd_intf_pins processing_system7_0/IIC_0]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins processing_system7_0/M_AXI_GP0]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_1/ARESETN] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net Data_Mover_Bridge_0_o_daq_done_IRQ [get_bd_pins In2] [get_bd_pins processing_system7_0/GPIO_I] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net Data_Mover_Bridge_0_o_dma_tx_trigger [get_bd_pins In1] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net axi_timer_0_interrupt [get_bd_pins In0] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins slowest_sync_clk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/M02_ACLK] [get_bd_pins axi_interconnect_0/M03_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins dcm_locked] [get_bd_pins proc_sys_reset_0/dcm_locked]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins S00_ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/M02_ARESETN] [get_bd_pins axi_interconnect_0/M03_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_interconnect_1/M00_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins FCLK_CLK0] [get_bd_pins processing_system7_0/FCLK_CLK0]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins processing_system7_0/IRQ_F2P] [get_bd_pins xlconcat_0/dout]
  
  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set ADC_SPI_CH1 [ create_bd_intf_port -mode Master -vlnv Bio-Rad.Com:user:DNA2_ADC_SPI_Interface_rtl:1.0 ADC_SPI_CH1 ]
  set ADC_SPI_CH2 [ create_bd_intf_port -mode Master -vlnv Bio-Rad.Com:user:DNA2_ADC_SPI_Interface_rtl:1.0 ADC_SPI_CH2 ]
  set ADC_SPI_CH3 [ create_bd_intf_port -mode Master -vlnv Bio-Rad.Com:user:DNA2_ADC_SPI_Interface_rtl:1.0 ADC_SPI_CH3 ]
  set ADC_SPI_CH4 [ create_bd_intf_port -mode Master -vlnv Bio-Rad.Com:user:DNA2_ADC_SPI_Interface_rtl:1.0 ADC_SPI_CH4 ]
  set ADC_SPI_CH5 [ create_bd_intf_port -mode Master -vlnv Bio-Rad.Com:user:DNA2_ADC_SPI_Interface_rtl:1.0 ADC_SPI_CH5 ]
  set CAN_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:can_rtl:1.0 CAN_0 ]
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
  set IIC_Ch1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC_Ch1 ]

  # Create ports
  set BTNL_daq_trigger [ create_bd_port -dir I BTNL_daq_trigger ]
  set JB3_wlast [ create_bd_port -dir O JB3_wlast ]
  set JB4_timer_en [ create_bd_port -dir O JB4_timer_en ]
  set T1_DMA [ create_bd_port -dir O T1_DMA ]
  set i_DAQ_en [ create_bd_port -dir I i_DAQ_en ]
  set i_isDone_Trig_SW0 [ create_bd_port -dir I i_isDone_Trig_SW0 ]
  set o_DAQ_LED_indicator [ create_bd_port -dir O o_DAQ_LED_indicator ]
  set o_LED_indicator [ create_bd_port -dir O -from 4 -to 0 o_LED_indicator ]
  set o_test01 [ create_bd_port -dir O o_test01 ]
  set o_test02_mvalid [ create_bd_port -dir O o_test02_mvalid ]
  set o_test03_mrdy [ create_bd_port -dir O o_test03_mrdy ]

  # Create instance: Data_Mover_Bridge_0, and set properties
  set Data_Mover_Bridge_0 [ create_bd_cell -type ip -vlnv Bio-Rad.Com:user:Data_Mover_Bridge:1.25.4 Data_Mover_Bridge_0 ]
  set_property -dict [ list CONFIG.C_S00_AXI_DATA_WIDTH {32}  ] $Data_Mover_Bridge_0

  # Create instance: IIC_Multiplexer_0, and set properties
  set IIC_Multiplexer_0 [ create_bd_cell -type ip -vlnv Bio-Rad.Com:user:IIC_Multiplexer:1.03 IIC_Multiplexer_0 ]

  # Create instance: Zynq_Processing_System
  create_hier_cell_Zynq_Processing_System [current_bd_instance .] Zynq_Processing_System

  # Create instance: axi_timer_0, and set properties
  set axi_timer_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 axi_timer_0 ]

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.1 clk_wiz_0 ]
  set_property -dict [ list CONFIG.CLKOUT1_JITTER {191.696} CONFIG.CLKOUT1_PHASE_ERROR {114.212} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {25} CONFIG.CLKOUT2_JITTER {144.719} CONFIG.CLKOUT2_PHASE_ERROR {114.212} CONFIG.CLKOUT2_USED {true} CONFIG.NUM_OUT_CLKS {2} CONFIG.PRIMITIVE {PLL} CONFIG.USE_RESET {false}  ] $clk_wiz_0

  # Create instance: master_controller_0, and set properties
  set master_controller_0 [ create_bd_cell -type ip -vlnv Bio-Rad.Com:user:master_controller:1.04 master_controller_0 ]

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list CONFIG.CONST_VAL {0} CONFIG.CONST_WIDTH {3}  ] $xlconstant_0

  # Create interface connections
  connect_bd_intf_net -intf_net Data_Mover_Bridge_0_ADC_SPI_CH1 [get_bd_intf_ports ADC_SPI_CH1] [get_bd_intf_pins Data_Mover_Bridge_0/ADC_SPI_CH1]
  connect_bd_intf_net -intf_net Data_Mover_Bridge_0_ADC_SPI_CH2 [get_bd_intf_ports ADC_SPI_CH2] [get_bd_intf_pins Data_Mover_Bridge_0/ADC_SPI_CH2]
  connect_bd_intf_net -intf_net Data_Mover_Bridge_0_ADC_SPI_CH3 [get_bd_intf_ports ADC_SPI_CH3] [get_bd_intf_pins Data_Mover_Bridge_0/ADC_SPI_CH3]
  connect_bd_intf_net -intf_net Data_Mover_Bridge_0_ADC_SPI_CH4 [get_bd_intf_ports ADC_SPI_CH4] [get_bd_intf_pins Data_Mover_Bridge_0/ADC_SPI_CH4]
  connect_bd_intf_net -intf_net Data_Mover_Bridge_0_ADC_SPI_CH5 [get_bd_intf_ports ADC_SPI_CH5] [get_bd_intf_pins Data_Mover_Bridge_0/ADC_SPI_CH5]
  connect_bd_intf_net -intf_net IIC_Multiplexer_0_IIC_Ch1 [get_bd_intf_ports IIC_Ch1] [get_bd_intf_pins IIC_Multiplexer_0/IIC_Ch1]
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins Data_Mover_Bridge_0/M00_AXI_S2MM] [get_bd_intf_pins Zynq_Processing_System/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins Zynq_Processing_System/M00_AXI] [get_bd_intf_pins axi_timer_0/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins Data_Mover_Bridge_0/S00_AXI] [get_bd_intf_pins Zynq_Processing_System/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins Zynq_Processing_System/M02_AXI] [get_bd_intf_pins master_controller_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M03_AXI [get_bd_intf_pins Zynq_Processing_System/M03_AXI] [get_bd_intf_pins master_controller_0/S_AXI_INTR]
  connect_bd_intf_net -intf_net processing_system7_0_CAN_0 [get_bd_intf_ports CAN_0] [get_bd_intf_pins Zynq_Processing_System/CAN_0]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins Zynq_Processing_System/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins Zynq_Processing_System/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_IIC_0 [get_bd_intf_pins IIC_Multiplexer_0/IIC_master] [get_bd_intf_pins Zynq_Processing_System/IIC_0]

  # Create port connections
  connect_bd_net -net Data_Mover_Bridge_0_o_DAQ_LED_indicator [get_bd_ports o_DAQ_LED_indicator] [get_bd_pins Data_Mover_Bridge_0/o_DAQ_LED_indicator]
  connect_bd_net -net Data_Mover_Bridge_0_o_LED_indicator [get_bd_ports o_LED_indicator] [get_bd_pins Data_Mover_Bridge_0/o_LED_indicator]
  connect_bd_net -net Data_Mover_Bridge_0_o_daq_done_IRQ [get_bd_ports JB4_timer_en] [get_bd_pins Data_Mover_Bridge_0/o_daq_done_IRQ] [get_bd_pins Zynq_Processing_System/In2]
  connect_bd_net -net Data_Mover_Bridge_0_o_data_tx_done [get_bd_ports JB3_wlast] [get_bd_pins Data_Mover_Bridge_0/o_data_tx_done]
  connect_bd_net -net Data_Mover_Bridge_0_o_dma_tx_trigger [get_bd_ports T1_DMA] [get_bd_pins Data_Mover_Bridge_0/o_dma_tx_trigger]
  connect_bd_net -net Data_Mover_Bridge_0_o_test01 [get_bd_ports o_test01] [get_bd_pins Data_Mover_Bridge_0/o_test01]
  connect_bd_net -net Data_Mover_Bridge_0_o_test02_mvalid [get_bd_ports o_test02_mvalid] [get_bd_pins Data_Mover_Bridge_0/o_test02_mvalid]
  connect_bd_net -net Data_Mover_Bridge_0_o_test03_mrdy [get_bd_ports o_test03_mrdy] [get_bd_pins Data_Mover_Bridge_0/o_test03_mrdy]
  connect_bd_net -net Data_Mover_Bridge_0_o_timer_freeze [get_bd_pins Data_Mover_Bridge_0/o_timer_freeze] [get_bd_pins axi_timer_0/freeze]
  connect_bd_net -net Data_Mover_Bridge_0_o_timer_trig [get_bd_pins Data_Mover_Bridge_0/o_timer_trig] [get_bd_pins axi_timer_0/capturetrig1]
  connect_bd_net -net axi_timer_0_generateout0 [get_bd_pins Data_Mover_Bridge_0/i_adc_trigger] [get_bd_pins axi_timer_0/generateout0]
  connect_bd_net -net axi_timer_0_interrupt [get_bd_pins Zynq_Processing_System/In0] [get_bd_pins axi_timer_0/interrupt]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins Data_Mover_Bridge_0/i_adc_clk_src] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins Data_Mover_Bridge_0/m00_axi_s2mm_aclk] [get_bd_pins Data_Mover_Bridge_0/s00_axi_aclk] [get_bd_pins Zynq_Processing_System/slowest_sync_clk] [get_bd_pins axi_timer_0/s_axi_aclk] [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins master_controller_0/s00_axi_aclk] [get_bd_pins master_controller_0/s_axi_intr_aclk]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins Zynq_Processing_System/dcm_locked] [get_bd_pins clk_wiz_0/locked]
  connect_bd_net -net i_DAQ_en_1 [get_bd_ports i_DAQ_en] [get_bd_pins Data_Mover_Bridge_0/i_DAQ_en]
  connect_bd_net -net i_daq_start_trigger_1 [get_bd_ports BTNL_daq_trigger] [get_bd_pins master_controller_0/i_daq_start_trigger]
  connect_bd_net -net i_isDone_Trig_1 [get_bd_ports i_isDone_Trig_SW0] [get_bd_pins Data_Mover_Bridge_0/i_isDone_Trig]
  connect_bd_net -net master_controller_0_irq [get_bd_pins Zynq_Processing_System/In1] [get_bd_pins master_controller_0/irq]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins Data_Mover_Bridge_0/m00_axi_s2mm_aresetn] [get_bd_pins Data_Mover_Bridge_0/s00_axi_aresetn] [get_bd_pins IIC_Multiplexer_0/reset] [get_bd_pins Zynq_Processing_System/S00_ARESETN] [get_bd_pins axi_timer_0/s_axi_aresetn] [get_bd_pins master_controller_0/s00_axi_aresetn] [get_bd_pins master_controller_0/s_axi_intr_aresetn]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins Zynq_Processing_System/FCLK_CLK0] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins IIC_Multiplexer_0/ch_select] [get_bd_pins xlconstant_0/dout]

  # Create address segments
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces Data_Mover_Bridge_0/M00_AXI_S2MM] [get_bd_addr_segs Zynq_Processing_System/processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x10000 -offset 0x43C00000 [get_bd_addr_spaces Zynq_Processing_System/processing_system7_0/Data] [get_bd_addr_segs Data_Mover_Bridge_0/S00_AXI/S00_AXI_reg] SEG_Data_Mover_Bridge_0_S00_AXI_reg
  create_bd_addr_seg -range 0x10000 -offset 0x42800000 [get_bd_addr_spaces Zynq_Processing_System/processing_system7_0/Data] [get_bd_addr_segs axi_timer_0/S_AXI/Reg] SEG_axi_timer_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x43C10000 [get_bd_addr_spaces Zynq_Processing_System/processing_system7_0/Data] [get_bd_addr_segs master_controller_0/S00_AXI/S00_AXI_reg] SEG_master_controller_0_S00_AXI_reg
  create_bd_addr_seg -range 0x10000 -offset 0x43C20000 [get_bd_addr_spaces Zynq_Processing_System/processing_system7_0/Data] [get_bd_addr_segs master_controller_0/S_AXI_INTR/S_AXI_INTR_reg] SEG_master_controller_0_S_AXI_INTR_reg
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


