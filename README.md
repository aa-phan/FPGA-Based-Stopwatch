# FPGA-based Stopwatch

This repository contains an FPGA-based stopwatch designed by Aaron Phan and Aneri Patel for ECE 316: Digital Logic Design at The University of Texas at Austin, taught by Dr. Jaydeep Kulkarni.

## Project Overview

The stopwatch is implemented in Verilog and runs on a Basys3 FPGA board, utilizing the on-board clock to measure elapsed time and display it on the 7-segment display. Key features include:

- **Clock Division**: Divides the FPGA’s clock signal to create appropriate time increments (e.g., seconds or milliseconds) for the stopwatch display.
- **Finite State Machines (FSMs)**: Controls the stopwatch’s core functionalities—start, stop, and reset.
- **User Interface**: Switches or push-buttons on the Basys3 board allow users to control the stopwatch functions:
  - **Start/Pause**: Starts or pauses the stopwatch.
  - **Reset**: Resets the stopwatch back to zero.

## Technology and Hardware Used

- **Verilog**: Hardware description language for digital design implementation.
- **Basys3 FPGA Board**: Hardware platform featuring on-board clock and 7-segment display.
  
## Usage and Restrictions

> **Important**: This code is intended solely for portfolio and demonstration purposes with potential employers. It is not to be used in any manner that constitutes cheating, plagiarism, or uncredited usage.

For any questions regarding implementation or usage, please contact Aaron Phan at [atp2323@utexas.edu](mailto:atp2323@utexas.edu).
