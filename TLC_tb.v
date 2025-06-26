`timescale 1ns / 1ps

module TLC_tb;

    // Inputs
    reg clk;
    reg reset;

    // Outputs
    wire [7:0] light;

    // Instantiate the TLC module
    TLC uut (
        .clk(clk),
        .reset(reset),
        .light(light)
    );

    // Clock generation: 10 ns period (100 MHz)
    always #50 clk = ~clk;

    // Stimulus
    initial begin
        clk = 0;
        reset = 1;
        #200;
        reset = 0;
        #10000;
        reset = 1;
        #200;
        reset = 0;
        #10000;
        $finish;
    end

    // Monitor output state
    initial begin
        $display("Time(ns)\tReset\tLight");
        $monitor("%0dns\t%b\t%s", $time, reset, light);
    end

endmodule
