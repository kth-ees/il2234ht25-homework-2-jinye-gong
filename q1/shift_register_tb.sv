module shift_register_tb;


logic clk;
logic rst_n;    
logic serial_parallel;
logic load_enable;
logic serial_in;
logic [3:0] parallel_in;
logic [3:0] parallel_out;
logic serial_out;




// complete here
    shift_register #(4) dut (
        .clk(clk),
        .rst_n(rst_n),
        .serial_parallel(serial_parallel),
        .load_enable(load_enable),
        .serial_in(serial_in),
        .parallel_in(parallel_in),
        .parallel_out(parallel_out),
        .serial_out(serial_out)
    );



initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 time units clock period
end

initial begin
    // Test sequence
    rst_n = 0; load_enable = 0; serial_parallel = 0; serial_in = 0; parallel_in = 4'b0000;
    #15;
    
    rst_n = 1; // Release reset
    #10;

    // Test Serial Mode
    serial_parallel = 0; // Serial mode
    load_enable = 1; 

    serial_in = 1; 
    #10; // Shift in '1'
    
    serial_in = 0; 
    #10; // Shift in '0'
    
    serial_in = 1; 
    #10; // Shift in '1'

    serial_in = 1; 
    #10; // Shift in '1'
    
    load_enable = 0; 
    #10; // No loading

    // Test Parallel Mode
    serial_parallel = 1; // Parallel mode
    load_enable = 1; 
    parallel_in = 4'b1010; 
    #10; // Load parallel data

    load_enable = 0; 
    #10; // No loading

    $finish;


    end

endmodule