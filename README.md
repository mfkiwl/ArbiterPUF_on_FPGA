# Arbiter PUF on FPGA
Implementation of an Arbiter Physical Unclonable Function (PUF) in Verilog, developed as part of my Bachelor's thesis in Computer Science.

The project explores the design, implementation, and testing of an Arbiter PUF on an FPGA platform, focusing on its properties as a hardware security primitive for applications such as device authentication and cryptographic key generation.
# Repository structure
- [Code source](src/)
    - [Arbiter PUF implementation](src/PUF/)
    - [Arbiter PUF evaluation](src/evaluation/)
        - [Data extrapolated](src/evaluation/data/)
        - [Script to build plots](src/evaluation/plots/)
- [Documents](docs/)
    - [Thesis PDF](docs/Arbiter_PUF_implementation_on_FPGA.pdf)
    - [Slides on HDL for IoT course](docs/Introduction_HDL.pdf)

# Tools
- [**Vivado**](https://www.xilinx.com/products/design-tools/vivado.html): Software suite for synthesis of hardware description language designs (HDL).
- [**Nexys A7**](https://digilent.com/reference/programmable-logic/nexys-a7/start): FPGA board
- **Verilog**: HDL language to implement PUF design
- **Python**: to calculate the metrics to evaluate PUF