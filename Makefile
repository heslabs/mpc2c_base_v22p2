

SHELL := /bin/bash
export PRJ=proj
export BD=top
export TOP=${BD}_wrapper
export NJOBS=8

help:
	@echo ""
	@echo "+-----------------------------------------------------"
	@echo "| HAPS AXI-C2C DDR Dxample"
	@echo "+-----------------------------------------------------"
	@echo "| 1. \$$ make new : Create new Vivado project"
	@echo "| 2. \$$ make prj : Open prebuilt Vivado project"
	@echo "| 3. \$$ make com : Compile Vivado project"
	@echo "| 3. \$$ make exp : Export Hardware and bitstream"
	@echo "+-----------------------------------------------------"
	@echo ""


hw: new com exp

prj:
	@cd ./vivado && vivado -mode gui -project ./$(PRJ).xpr &

new:
	@\rm -rf ./vivado && mkdir -p ./vivado
	@cd ./vivado && cp -f ../source/top.tcl ./top.tcl
	@cd ./vivado && cp -f ../source/top.xdc ./top.xdc
	@cd ./vivado && vivado -mode tcl -source ../source/vivado_new.tcl


com: clean
	@cd ./vivado && vivado -mode tcl -project ./$(PRJ).xpr -source ../source/vivado_com.tcl

exp:
	@mkdir -p ./export
	@cp -f ./vivado/$(TOP).xsa ./export/$(TOP).xsa
	@cp -f ./vivado/$(PRJ).runs/impl_1/$(TOP).bit ./export/$(TOP).bit
	@cp -f ./vivado/*.rpt ./export
	@ls -lh ./export/*.*

uart:
	@sudo chmod 666 /dev/ttyUSB*
	@sudo putty -serial -sercfg 115200,8,n,1,N -fn "client:Ubuntu Mono 16"  /dev/ttyUSB1 &

clean:
	@cd ./vivado && \rm -rf vivado.* .Xil *.xsa *.bit *.os *.jou *.og  $(PRJ).runs  $(PRJ).cache

