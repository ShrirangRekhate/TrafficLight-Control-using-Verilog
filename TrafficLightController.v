`timescale 1ns / 1ps                                                                                           
module TLC(reset,clk,light);                                                                                   
input reset,clk;                                                                                               
output reg [7:0]light;                                                                                         
reg [7:0]state,n_state;                                                                                        
reg [4:0]q;                                                                                                    
parameter     S0 = 8'b01010101,
              S1 = 8'b00000010,
              S2 = 8'b00000101,
              S3 = 8'b00001000,
              S4 = 8'b00010100,
              S5 = 8'b00100000,
              S6 = 8'b01010000,
              S7 = 8'b10000000,
              S8 = 8'b01000001;

 // Sequential logic for state and counter                                                                                         
 always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            n_state <= S1;
            q <= 15;
        end else begin
            state <= n_state;
            if (state == S0 || state == S2 || state == S4 || state == S6 || state == S8) begin
                if (q != 0) q <= q - 1;
                else q <= 15;
            end else begin
                if (q != 0) q <= q - 1;
                else q <= 4;
            end
        end
    end                                                                                                          
                                                                                                               
// Combinational logic for next state                                                                                                 
    always @(*) begin
        case (state)
            S0: n_state = (q != 0) ? S0 : S1;
            S1: n_state = (q != 0) ? S1 : S2;
            S2: n_state = (q != 0) ? S2 : S3;
            S3: n_state = (q != 0) ? S3 : S4;
            S4: n_state = (q != 0) ? S4 : S5;
            S5: n_state = (q != 0) ? S5 : S6;
            S6: n_state = (q != 0) ? S6 : S7;
            S7: n_state = (q != 0) ? S7 : S8;
            S8: n_state = (q != 0) ? S8 : S1;
            default: n_state = S1;
        endcase
    end                                                                                     
    // Output logic
 always @(posedge clk or posedge reset) begin
        if (reset) begin
            light <= S0; 
        end else begin
            case (state)
                S0: light <= S0;
                S1: light <= S1;
                S2: light <= S2;
                S3: light <= S3;
                S4: light <= S4;
                S5: light <= S5;
                S6: light <= S6;
                S7: light <= S7;
                S8: light <= S8;
                default: light <= S1;
            endcase
        end
    end
endmodule
                                                                                                       