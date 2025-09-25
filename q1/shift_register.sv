module shift_register #(parameter N=4)
                      (input logic clk,
                       input logic rst_n,
                       input logic serial_parallel,
                       input logic load_enable,
                       input logic serial_in,
                       input logic [N-1:0] parallel_in,
                       output logic [N-1:0] parallel_out,
                       output logic serial_out);

//complete here


    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            serial_out <= '0;
            parallel_out <= '0;
        end
        else begin
            case (serial_parallel)
                1'b0: begin // Serial mode
                    if (load_enable) begin
                        serial_out <= serial_in;
                        parallel_out <= {parallel_out[N-2:0], serial_in};
                    end
                end
                1'b1: begin // Parallel mode
                    if (load_enable) begin
                        parallel_out <= parallel_in;
                        serial_out <= parallel_in[N-1];
                    end
                end
            endcase

    end

    end





endmodule
