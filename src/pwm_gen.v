module pwm_gen
  (
    input i_clk, i_rst,
    input [3:0] i_duty,
    input [1:0] i_freq, output o_pwm
  );

  reg  [6:0] r_counter;
  wire  [6:0] w_max_cycles;
  wire  [6:0] w_high_cycles;

  assign o_pwm = (r_counter < w_high_cycles) ? 1'b1 : 1'b0;

  always@(posedge i_clk) begin
    if (i_rst == 1'b1)
      r_counter = 0;
    else
      r_counter = r_counter + 1;
      if (r_counter == w_max_cycles)
        r_counter = 0;
  end

  // set maximum cycles for corresponding PWM frequency.
  always@(i_freq) begin
    case (i_freq)
      0 : w_max_cycles = 80; // 80 cycles; 1250 Hz
      1 : w_max_cycles = 40; // 40 cycles; 625 Hz
      2 : w_max_cycles = 20; // 20 cycles; 312.5 Hz
      3 : w_max_cycles = 10; // 10 cycles; 156.25 Hz
      default : w_max_cycles = 80;
    endcase
  end

  // set number of high cycles for corresponding PWM duty cycle
  always@(i_duty or i_freq) begin
    if (i_freq == 0) begin
        case(i_duty)
          0 : w_high_cycles = 0;
          1 : w_high_cycles = 8;
          2 : w_high_cycles = 16;
          3 : w_high_cycles = 24;
          4 : w_high_cycles = 32;
          5 : w_high_cycles = 40;
          6 : w_high_cycles = 48;
          7 : w_high_cycles = 56;
          8 : w_high_cycles = 64;
          9 : w_high_cycles = 72;
          10 : w_high_cycles = 80;
          default : w_high_cycles = 80;
        endcase
    end else if (i_freq == 1) begin
        case(i_duty)
          0 : w_high_cycles = 0;
          1 : w_high_cycles = 4;
          2 : w_high_cycles = 8;
          3 : w_high_cycles = 12;
          4 : w_high_cycles = 16;
          5 : w_high_cycles = 20;
          6 : w_high_cycles = 24;
          7 : w_high_cycles = 28;
          8 : w_high_cycles = 32;
          9 : w_high_cycles = 36;
          10 : w_high_cycles = 40;
          default : w_high_cycles = 40;
        endcase
    end else if (i_freq == 2) begin
        case(i_duty)
          0 : w_high_cycles = 0;
          1 : w_high_cycles = 2;
          2 : w_high_cycles = 4;
          3 : w_high_cycles = 6;
          4 : w_high_cycles = 8;
          5 : w_high_cycles = 10;
          6 : w_high_cycles = 12;
          7 : w_high_cycles = 14;
          8 : w_high_cycles = 16;
          9 : w_high_cycles = 18;
          10 : w_high_cycles = 20;
          default : w_high_cycles = 20;
        endcase
    end else begin
        case(i_duty)
          0 : w_high_cycles = 0;
          1 : w_high_cycles = 1;
          2 : w_high_cycles = 2;
          3 : w_high_cycles = 3;
          4 : w_high_cycles = 4;
          5 : w_high_cycles = 5;
          6 : w_high_cycles = 6;
          7 : w_high_cycles = 7;
          8 : w_high_cycles = 8;
          9 : w_high_cycles = 9;
          10 : w_high_cycles = 10;
          default : w_high_cycles = 10;
        endcase
    end
  end
endmodule
