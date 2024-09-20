## haps_mpsoc_base

1. Create the Vivado block diagram from prebuilt tcl file
```
  $ make hw-new
```

2. Launch synthesis and implementaiton of Vivadio project
```
  $ make hw-com
```

3. Export hardware and bitstream
```
  $ make hw-exp
```

4. Review the project outputs in ./export

* Export hardware (*.xsa) and bitstream (*.bit)
```
    ./export/c2c_wrapper.xsa
    ./export/c2c_wrapper.bit
```

*Review timing and utilization report

```
    ./export/hw_timing.rpt  
    ./export/hw_util.rpt
```

---
### Timing and Utilization report
