# cordic-processor
CORDIC processor for sine and cosine computation using Verilog HDL
# CORDIC Processor for Trigonometric Computation

This project implements a hardware-efficient CORDIC (COordinate Rotation DIgital Computer) processor in Verilog for computing sine and cosine values using an iterative shift–add algorithm.

---

## Overview

The CORDIC algorithm is widely used in digital signal processing and hardware design due to its ability to compute trigonometric functions without using multipliers. This implementation uses fixed-point arithmetic and iterative micro-rotations to achieve accurate sine and cosine outputs.

The design is verified using Xilinx Vivado through RTL simulation and waveform analysis.

---

## Key Features

- Multiplier-free architecture using shift and add operations  
- Fixed-point Q2.30 representation for high precision  
- 16-iteration iterative design for accurate results  
- Counter-based sequential control logic  
- Synthesizable RTL design  
- Supports angle input range from -π to +π  

---

## Architecture

The CORDIC processor consists of:

- X, Y, Z registers for iterative computation  
- Add/Subtract units for vector rotation  
- Barrel shifters using shift operators  
- Arctangent lookup table (ROM using function)  
- Iteration counter for control logic  

---

## Working Principle

The CORDIC algorithm performs vector rotation through a sequence of micro-rotations. At each iteration:

- Direction of rotation depends on the sign of the angle (z)  
- Shift operations replace multiplications  
- Precomputed arctangent values are used  
- The vector converges to the desired angle  

After all iterations, the outputs correspond to cosine (x) and sine (y)


---

## Simulation and Verification

- Tool Used: Xilinx Vivado  
- Functional verification using a custom Verilog testbench  
- Multiple angle inputs tested (−π to +π)  
- Outputs compared with reference sine and cosine values  
- Waveforms analyzed to validate correctness  

---

## Results

The design successfully computes sine and cosine values with good accuracy using fixed-point arithmetic. The waveform results confirm correct iterative convergence of the CORDIC algorithm.

---

## Applications

- Digital Signal Processing (DSP)  
- Communication systems  
- Embedded systems  
- FPGA-based designs  
- Graphics and robotics  

---

## Future Work

- Pipeline architecture for high-speed performance  
- Support for additional functions (tan, sinh, cosh)  
- Hardware optimization for area and power  
- Integration into DSP or SoC systems  

---

## Author

Suraksha K S  
B.E. Electronics and Communication Engineering  

---

## License

This project is developed for academic and learning purposes.
