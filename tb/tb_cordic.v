`timescale 1ns/1ps

module tb_cordic;

    reg clk = 0;
    always #5 clk = ~clk;       // 100 MHz clock

    reg rst = 1;
    reg start = 0;

    reg signed [31:0] angle_in;
    wire signed [31:0] cos_out;
    wire signed [31:0] sin_out;
    wire done;

    // Instantiate CORDIC
    cordic dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .angle_in(angle_in),
        .cos_out(cos_out),
        .sin_out(sin_out),
        .done(done)
    );

    // Q2.30 to real
    function real q2real;
        input signed [31:0] v;
        begin
            q2real = $itor(v) / (2.0 ** 30);
        end
    endfunction

    // real to Q2.30
    function signed [31:0] real2q;
        input real r;
        begin
            real2q = $rtoi(r * (2.0 ** 30));
        end
    endfunction

    real angles [0:6];
    integer i;

    initial begin
        // Waveform dump
        $dumpfile("cordic_tb.vcd");
        $dumpvars(0, tb_cordic);

        // Angles in radians
        angles[0] = -3.14159265358979;
        angles[1] = -1.5707963267949;
        angles[2] = -0.785398163397448;
        angles[3] = 0.0;
        angles[4] = 0.785398163397448;
        angles[5] = 1.5707963267949;
        angles[6] = 3.14159265358979;

        // Reset
        rst = 1;
        angle_in = 0;
        start = 0;
        #50;
        rst = 0;
        #50;

        // Sweep through angles
        for (i = 0; i < 7; i = i + 1) begin
            angle_in = real2q(angles[i]);

            #20;
            start = 1;
            #10 start = 0;

            wait(done == 1);
            #5;

            $display("\nAngle(rad) = %f", angles[i]);
            $display("cos = %f (ref=%f)", q2real(cos_out), $cos(angles[i]));
            $display("sin = %f (ref=%f)", q2real(sin_out), $sin(angles[i]));

            #40;
        end

        $display("Simulation Completed.");
        #100;
        $finish;
    end

endmodule
