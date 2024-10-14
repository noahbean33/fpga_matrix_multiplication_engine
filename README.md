# fpga_matrix_multiplication_engine

Project Overview:
The project aims to accelerate integer matrix multiplication by leveraging the parallel processing capabilities of an FPGA. The design will feature 4 processing cores working in parallel to handle integer matrix multiplication, which should offer a significant speedup over traditional CPU-based implementations.
Key Features:
Platform: Nexys A7-100T, utilizing the Xilinx Artix-7 FPGA with 240 DSP slices and 4,860 Kbits of Block RAM.
Core Design: The matrix multiplication engine will consist of 4 parallel processing cores, optimized to fully utilize available DSP slices for multiply-accumulate operations.
Matrix Size: The design will support matrices of integers up to 256x256 elements, with data stored in BRAM.
Input/Output: Matrices will be transferred via UART USB from a computer to the FPGA, and the result will be sent back via the same interface.
Performance Goal: The project will demonstrate faster integer matrix multiplication compared to CPU-based implementations, even when accounting for input/output time.
Expanded 10-Week Project Timeline:
Weeks 1-2: Initial Design and Simulation
Design the 2-core integer matrix multiplication engine in Verilog and simulate it using Vivado to verify correct functionality with smaller matrices.
Weeks 3-4: Core Expansion and Resource Optimization
Scale the design to 4 cores and optimize DSP slice and BRAM usage for handling larger matrices up to 256x256.
Simulate the multi-core system and evaluate resource utilization.
Weeks 5-6: UART Integration and Data Transfer
Implement UART communication for transferring integer matrices to and from the FPGA.
Integrate the UART modules with the matrix multiplication engine for efficient data transfer.
Weeks 7-8: Testing and Debugging on Nexys A7
Test the complete system on the Nexys A7 with integer matrix sizes of 64x64, 128x128, and 256x256.
Debug and optimize the design for real-time performance, comparing it with a CPU-based solution.
Weeks 9-10: Performance Tuning, Documentation, and Presentation
Fine-tune the performance, focusing on reducing latency and maximizing computational throughput.
Compile final documentation with details on resource usage, performance benchmarks, and comparisons with CPU-based integer matrix multiplication.
Prepare for project presentation.
Objectives:
Design a 4-core integer matrix multiplication engine in Verilog and optimize it for parallelism.
Implement UART communication to handle integer matrix input/output efficiently.
Test and compare performance against CPU-based integer matrix multiplication in terms of both speed and resource utilization.
Document the design, including performance benchmarks and any challenges encountered during the project.
This project aligns well with the course's goals and will demonstrate the advantages of hardware acceleration in computational tasks.
