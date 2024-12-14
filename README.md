# Arbiter PUF on FPGA

# Repository structure
- [Code source](src/)
    - [Arbiter PUF implementation](src/PUF/)
    - [Arbiter PUF evaluation](src/evaluation/)
        - [Data extrapolated](src/evaluation/data/)
        - [Script to build plots](src/evaluation/plots/)
- [Documents](docs/)
    - [Thesis PDF](docs/Arbiter_PUF_implementation_on_FPGA.pdf)
    - [Slides on HDL for IoT course](docs/Introduction_HDL.pdf)

# Evaluation metrics

# Tools
- [**Vivado**](https://www.xilinx.com/products/design-tools/vivado.html): Software suite for synthesis of hardware description language designs (HDL).
- [**Nexys A7**](https://digilent.com/reference/programmable-logic/nexys-a7/start): FPGA board
- **Verilog**: HDL language to implement PUF design
- **Python**: to calculate the metrics to evaluate PUF