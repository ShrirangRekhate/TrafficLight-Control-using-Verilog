# Traffic Light Controller (Verilog)

A Finite State Machine (FSM)-based traffic light controller designed in Verilog.  
This project models a 4-way intersection with configurable green, yellow, and red light durations. It’s fully synthesizable and easy to simulate or deploy on an FPGA.
![Typical traffic light system at a four-way intersection ...](https://github.com/ShrirangRekhate/TrafficLight-Controller-using-Verilog/blob/main/Images/Typical-traffic-light-system-at-a-four-way-intersection.png?raw=true)

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
  - `reset`: synchronous reset (initializes to all-yellow)

---

## ⚙️ Features

- **Synthesizable logic** — suitable for FPGA deployment
- **Testbench** for waveform generation and behavior verification
- Regulates four traffic lights at a four-way intersection.
- The cycle of traffic light: Red ⇒ Yellow ⇒ Green ⇒ Yellow ⇒ Red.
- The change from Red to Green always comes through Yellow.
- Prevents the simultaneous showing of two signals green at one time.
- Duration of Green light: 15 seconds.
- Duration of Yellow light: 4 second.
- Travels in the direction of traffic lights from the clockwise.
- Resets hardware at all Yellow so that the reset is safe and will not be confusing.

---

## 🧠 State Diagram & Timing
![State-Diagram](https://github.com/ShrirangRekhate/TrafficLight-Controller-using-Verilog/blob/main/Images/Schematic.png?raw=true)


#### State machine

 The output is encoded as follows to get 8-bit output 
- R = 00
- Y = 01
- G = 10

| Current State | Next State | OUTPUT | (Light) |
| ---   | --- | --- | --- |
| RST   | S0 | YYYY | 01 01 01 01 |
| S0	| S1 | RRRG | 00 00 00 01 |
| S1	| S2 | RRYY | 00 00 01 01 |
| S2	| S3 | RRGR | 00 00 10 00 |
| S3	| S4 | RYYR | 00 01 01 00 |
| S4	| S5 | RGRR | 00 10 00 00 |
| S5	| S6 | YYRR | 01 01 00 00 |
| S6	| S7 | GRRR | 10 00 00 00 |
| S7	| S0 | YRRY | 01 00 00 01 |

#### RTL view

![rtl-view](https://github.com/ShrirangRekhate/TrafficLight-Controller-using-Verilog/blob/main/Images/Schematic.png?raw=true)

#### Simulation

![rtl-view](https://github.com/ShrirangRekhate/TrafficLight-Controller-using-Verilog/blob/main/Images/Simulation.png?raw=true)
for simulation decrease the clock frequency as simulation runs on unit nano seconds*
## Author

- [@ShrirangRekhate](https://www.github.com/ShrirangRekhate)


