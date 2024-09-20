

SHELL := /bin/bash
export PRJ=proj
export BD=c2c
export TOP=${BD}_wrapper
export NJOBS=8

help:
	@echo ""
	@echo "+-----------------------------------------------------"
	@echo "| HAPS + ZynqMPSoC Base Platform"
	@echo "+-----------------------------------------------------"
	@echo "| 1. \$$ make hw-new : Create new Vivado project"
	@echo "| 2. \$$ make hw-prj : Open prebuilt Vivado project"
	@echo "| 3. \$$ make hw-com : Compile Vivado project"
	@echo "| 3. \$$ make hw-exp : Export Hardware and bitstream"
	@echo "+-----------------------------------------------------"
	@echo ""


hw: hw-new hw-com hw-exp

hw-prj:
	@cd ./vivado && vivado -mode gui -project ./$(PRJ).xpr &

hw-new:
	@\rm -rf ./vivado && mkdir -p ./vivado
	@cd ./vivado && cp -f ../source/top.tcl ./top.tcl
	@cd ./vivado && cp -f ../source/top.xdc ./top.xdc
	@cd ./vivado && vivado -mode tcl -source ../source/vivado_new.tcl


hw-com:
	@cd ./vivado && \rm -rf vivado.* .Xil *.os *.jou *.og  $(PRJ).cache $(PRJ).runs
	@cd ./vivado && vivado -mode tcl -project ./$(PRJ).xpr -source ../source/vivado_com.tcl

hw-exp:
	@mkdir -p ./export
	@cp -f ./vivado/$(TOP).xsa ./export/$(TOP).xsa
	@cp -f ./vivado/$(PRJ).runs/impl_1/$(TOP).bit ./export/$(TOP).bit
	@cp -f ./vivado/*.rpt ./export
	@ls -lh ./export/*.*

uart:
	@sudo chmod 666 /dev/ttyUSB*
	@sudo putty -serial -sercfg 115200,8,n,1,N -fn "client:Ubuntu Mono 16"  /dev/ttyUSB1 &


