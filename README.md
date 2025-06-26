# Traffic Light Controller (Verilog)

A Finite State Machine (FSM)-based traffic light controller designed in Verilog.  
This project models a 4-way intersection with configurable green, yellow, and red light durations. It’s fully synthesizable and easy to simulate or deploy on an FPGA.

---

## 📌 Project Overview

- **Language**: Verilog (`.v`)
- **Design**: FSM with 9 states (S0–S8) representing different traffic signal phases.
- **Timing**:
  - Green/Red phases: 14 clock cycles
  - Yellow phases: 3 clock cycles
- **Output**: Displays traffic lights as 4-character ASCII strings (e.g., `"RRRG"`).
- **Inputs**:
  - `clk`: clock signal
  - `reset`: synchronous reset (initializes to all-red)

---

## ⚙️ Features

- **Configurable durations** for green/red and yellow transitions
- **ASCII-based output** for easier debugging and simulation (`"YYYY"`, `"RRRG"`, `"RRYY"`, etc.)
- **Synthesizable logic** — suitable for FPGA deployment
- **Testbench** for waveform generation and behavior verification

---

## 🧠 State Diagram & Timing

