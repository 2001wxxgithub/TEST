// Generated by CIRCT unknown git version
// Standard header to adapt well known macros to our needs.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

module SourceB(
  input         clock,
                reset,
                io_req_valid,
  input  [2:0]  io_req_bits_param,
  input  [11:0] io_req_bits_tag,
  input  [9:0]  io_req_bits_set,
  input         io_req_bits_clients,
                io_req_bits_hit,
                io_b_ready,
  output        io_req_ready,
                io_b_valid,
  output [1:0]  io_b_bits_param,
  output [31:0] io_b_bits_address,
  output        io_b_bits_hit
);

  reg         remain;	// @[SourceB.scala:47:25]
  wire        _param_T_1 = ~remain & io_req_valid;	// @[Decoupled.scala:51:35, SourceB.scala:47:25, :62:21]
  wire        b_valid = remain | io_req_valid;	// @[SourceB.scala:47:25, :69:21]
  reg  [11:0] tag_r;	// @[Reg.scala:19:16]
  reg  [9:0]  set_r;	// @[Reg.scala:19:16]
  reg  [2:0]  param_r;	// @[Reg.scala:19:16]
  always @(posedge clock) begin
    if (reset)
      remain <= 1'h0;	// @[SourceB.scala:47:25]
    else
      remain <= (remain | _param_T_1 & io_req_bits_clients) & ~(io_b_ready & b_valid & (remain ? remain : io_req_bits_clients));	// @[Decoupled.scala:51:35, SourceB.scala:47:25, :48:30, :49:30, :50:{23,37,39}, :53:19, :63:{24,37}, :69:21, :70:{19,32}]
    if (_param_T_1) begin	// @[Decoupled.scala:51:35]
      tag_r <= io_req_bits_tag;	// @[Reg.scala:19:16]
      set_r <= io_req_bits_set;	// @[Reg.scala:19:16]
      param_r <= io_req_bits_param;	// @[Reg.scala:19:16]
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    always @(posedge clock) begin	// @[SourceB.scala:60:12]
      if (~reset & ~(~io_req_valid | io_req_bits_clients)) begin	// @[SourceB.scala:60:{12,13,27}]
        if (`ASSERT_VERBOSE_COND_)	// @[SourceB.scala:60:12]
          $error("Assertion failed\n    at SourceB.scala:60 assert (!io.req.valid || io.req.bits.clients =/= 0.U)\n");	// @[SourceB.scala:60:12]
        if (`STOP_COND_)	// @[SourceB.scala:60:12]
          $fatal;	// @[SourceB.scala:60:12]
      end
    end // always @(posedge)
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        remain = _RANDOM_0[0];	// @[SourceB.scala:47:25]
        tag_r = _RANDOM_0[12:1];	// @[Reg.scala:19:16, SourceB.scala:47:25]
        set_r = _RANDOM_0[22:13];	// @[Reg.scala:19:16, SourceB.scala:47:25]
        param_r = _RANDOM_0[25:23];	// @[Reg.scala:19:16, SourceB.scala:47:25]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_req_ready = ~remain;	// @[SourceB.scala:47:25, :62:21]
  assign io_b_valid = b_valid;	// @[SourceB.scala:69:21]
  assign io_b_bits_param = remain ? param_r[1:0] : io_req_bits_param[1:0];	// @[Reg.scala:19:16, SourceB.scala:47:25, :75:20]
  assign io_b_bits_address = {4'h0, remain ? tag_r : io_req_bits_tag, remain ? set_r : io_req_bits_set, 6'h0};	// @[Cat.scala:33:92, Parameters.scala:220:15, Reg.scala:19:16, SourceB.scala:47:25, :73:18, :74:18]
  assign io_b_bits_hit = io_req_bits_hit;
endmodule

