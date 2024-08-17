module FSM(
    input In1, 
    input RST, 
    input CLK, 
    output reg Out1
); 

    reg [1:0] state; 

    // State encoding
    parameter a = 2'b00, 
              b = 2'b01, 
              c = 2'b10; 

    // Sequential logic with synchronous reset
    always @ (posedge CLK or posedge RST) begin
        if (RST == 1) begin 
            state <= a; 
            Out1 <= 0; 
        end else begin 
            case (state) 
                a: if (In1 == 1) begin 
                        state <= b; 
                        Out1 <= 0; 
                   end else begin 
                        state <= a; 
                        Out1 <= 0; 
                   end 

                b: if (In1 == 0) begin 
                        state <= c; 
                        Out1 <= 0; 
                   end else begin 
                        state <= b; 
                        Out1 <= 0; 
                   end 

                c: if (In1 == 0) begin 
                        state <= a; 
                        Out1 <= 1; 
                   end else begin 
                        state <= c; 
                        Out1 <= 0; 
                   end 

                default: begin 
                    state <= a; 
                    Out1 <= 0; 
                end
            endcase 
        end 
    end
endmodule
