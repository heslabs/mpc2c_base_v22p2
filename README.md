### Clone the GitHub project
```
$ git clone https://github.com/heslabs/haps_mpsoc_base
```
### Source tools environment
```
$ cd ./haps_mpsoc_base
$ soruce ./setenv.sh
```
* Modify the environment variable $EDA_HOME to match your tools installation folder

```
vim setenv.sh
export EDA_HOME=/home/eda
```

---
### Create and build Vivado hardware project

1. Create the Vivado block diagram from prebuilt tcl file
```
  $ make hw-new
```

2. Open prebuilt Vivado project
```
  $ make hw-prj
```

3. Launch synthesis and implementaiton of Vivadio project
```
  $ make hw-com
```

4. Export hardware and bitstream
```
  $ make hw-exp
```

5. Review the project outputs in ./export

* Export hardware (\*.xsa) and bitstream (\*.bit)
```
    ./export/c2c_wrapper.xsa
    ./export/c2c_wrapper.bit
```

* Review the utilization and timing report

```
    ./export/hw_timing.rpt  
    ./export/hw_util.rpt
```

---
### FPGA Utilization and Timing Report

* FPGA Utilization Report
```
  +----------------------------+-------+-------+------------+-----------+-------+
  |          Site Type         |  Used | Fixed | Prohibited | Available | Util% |
  +----------------------------+-------+-------+------------+-----------+-------+
  | CLB LUTs                   | 29992 |     0 |          0 |   4085760 |  0.73 |
  |   LUT as Logic             | 26570 |     0 |          0 |   4085760 |  0.65 |
  |   LUT as Memory            |  3422 |     0 |          0 |    956160 |  0.36 |
  |     LUT as Distributed RAM |  2206 |     0 |            |           |       |
  |     LUT as Shift Register  |  1216 |     0 |            |           |       |
  | CLB Registers              | 46108 |     0 |          0 |   8171520 |  0.56 |
  |   Register as Flip Flop    | 46107 |     0 |          0 |   8171520 |  0.56 |
  |   Register as Latch        |     0 |     0 |          0 |   8171520 |  0.00 |
  |   Register as AND/OR       |     1 |     0 |          0 |   8171520 | <0.01 |
  | CARRY8                     |   256 |     0 |          0 |    510720 |  0.05 |
  | F7 Muxes                   |   655 |     0 |          0 |   2042880 |  0.03 |
  | F8 Muxes                   |    87 |     0 |          0 |   1021440 | <0.01 |
  | F9 Muxes                   |     0 |     0 |          0 |    510720 |  0.00 |
  +----------------------------+-------+-------+------------+-----------+-------+
```


---
* FPGA Timing Report

```
WNS(ns)      TNS(ns)  TNS Failing Endpoints  TNS Total Endpoints      WHS(ns)      THS(ns)  THS Failing Endpoints  THS Total Endpoints     WPWS(ns)     TPWS(ns)  TPWS Failing Endpoints  TPWS Total Endpoints
    -------      -------  ---------------------  -------------------      -------      -------  ---------------------  -------------------     --------     --------  ----------------------  --------------------
     -1.199      -13.456                     12               123107        0.005        0.000                      0               122181        0.065        0.000                       0                 52784
```

Timing constraints are not met.

```
gclk_clk_p x               {0.000 5.000}     10.000          100.000
clk_100M_c2c_clk_wiz_0_0   {0.000 5.000}     10.000          100.000
clk_50M_c2c_clk_wiz_0_0    {0.000 10.000}    20.000          50.000
```



