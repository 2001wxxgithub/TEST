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

module TLDebugModuleInnerAsync(
  input  [2:0]  auto_dmiXing_in_a_mem_0_opcode,
                auto_dmiXing_in_a_mem_0_param,
  input  [1:0]  auto_dmiXing_in_a_mem_0_size,
  input         auto_dmiXing_in_a_mem_0_source,
  input  [8:0]  auto_dmiXing_in_a_mem_0_address,
  input  [3:0]  auto_dmiXing_in_a_mem_0_mask,
  input  [31:0] auto_dmiXing_in_a_mem_0_data,
  input         auto_dmiXing_in_a_mem_0_corrupt,
                auto_dmiXing_in_a_widx,
                auto_dmiXing_in_a_safe_widx_valid,
                auto_dmiXing_in_a_safe_source_reset_n,
                auto_dmiXing_in_d_ridx,
                auto_dmiXing_in_d_safe_ridx_valid,
                auto_dmiXing_in_d_safe_sink_reset_n,
                auto_dmInner_tl_in_a_valid,
  input  [2:0]  auto_dmInner_tl_in_a_bits_opcode,
                auto_dmInner_tl_in_a_bits_param,
  input  [1:0]  auto_dmInner_tl_in_a_bits_size,
  input  [9:0]  auto_dmInner_tl_in_a_bits_source,
  input  [11:0] auto_dmInner_tl_in_a_bits_address,
  input  [7:0]  auto_dmInner_tl_in_a_bits_mask,
  input  [63:0] auto_dmInner_tl_in_a_bits_data,
  input         auto_dmInner_tl_in_a_bits_corrupt,
                auto_dmInner_tl_in_d_ready,
                io_debug_clock,
                io_debug_reset,
                io_dmactive,
                io_innerCtrl_mem_0_resumereq,
  input  [9:0]  io_innerCtrl_mem_0_hartsel,
  input         io_innerCtrl_mem_0_ackhavereset,
                io_innerCtrl_mem_0_hasel,
                io_innerCtrl_mem_0_hamask_0,
                io_innerCtrl_mem_0_hrmask_0,
                io_innerCtrl_widx,
                io_innerCtrl_safe_widx_valid,
                io_innerCtrl_safe_source_reset_n,
                io_hartIsInReset_0,
  output        auto_dmiXing_in_a_ridx,
                auto_dmiXing_in_a_safe_ridx_valid,
                auto_dmiXing_in_a_safe_sink_reset_n,
  output [2:0]  auto_dmiXing_in_d_mem_0_opcode,
  output [1:0]  auto_dmiXing_in_d_mem_0_param,
                auto_dmiXing_in_d_mem_0_size,
  output        auto_dmiXing_in_d_mem_0_source,
                auto_dmiXing_in_d_mem_0_sink,
                auto_dmiXing_in_d_mem_0_denied,
  output [31:0] auto_dmiXing_in_d_mem_0_data,
  output        auto_dmiXing_in_d_mem_0_corrupt,
                auto_dmiXing_in_d_mem_0_hit,
                auto_dmiXing_in_d_widx,
                auto_dmiXing_in_d_safe_widx_valid,
                auto_dmiXing_in_d_safe_source_reset_n,
                auto_dmInner_tl_in_a_ready,
                auto_dmInner_tl_in_d_valid,
  output [2:0]  auto_dmInner_tl_in_d_bits_opcode,
  output [1:0]  auto_dmInner_tl_in_d_bits_size,
  output [9:0]  auto_dmInner_tl_in_d_bits_source,
  output [63:0] auto_dmInner_tl_in_d_bits_data,
  output        io_innerCtrl_ridx,
                io_innerCtrl_safe_ridx_valid,
                io_innerCtrl_safe_sink_reset_n,
                io_hgDebugInt_0
);

  wire        _dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_valid;	// @[AsyncQueue.scala:207:22]
  wire        _dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_resumereq;	// @[AsyncQueue.scala:207:22]
  wire [9:0]  _dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hartsel;	// @[AsyncQueue.scala:207:22]
  wire        _dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_ackhavereset;	// @[AsyncQueue.scala:207:22]
  wire        _dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hrmask_0;	// @[AsyncQueue.scala:207:22]
  wire        _dmactive_synced_dmactive_synced_dmactiveSync_io_q;	// @[ShiftReg.scala:45:23]
  wire        _dmiXing_auto_out_a_valid;	// @[Debug.scala:1848:27]
  wire [2:0]  _dmiXing_auto_out_a_bits_opcode;	// @[Debug.scala:1848:27]
  wire [2:0]  _dmiXing_auto_out_a_bits_param;	// @[Debug.scala:1848:27]
  wire [1:0]  _dmiXing_auto_out_a_bits_size;	// @[Debug.scala:1848:27]
  wire        _dmiXing_auto_out_a_bits_source;	// @[Debug.scala:1848:27]
  wire [8:0]  _dmiXing_auto_out_a_bits_address;	// @[Debug.scala:1848:27]
  wire [3:0]  _dmiXing_auto_out_a_bits_mask;	// @[Debug.scala:1848:27]
  wire [31:0] _dmiXing_auto_out_a_bits_data;	// @[Debug.scala:1848:27]
  wire        _dmiXing_auto_out_a_bits_corrupt;	// @[Debug.scala:1848:27]
  wire        _dmiXing_auto_out_d_ready;	// @[Debug.scala:1848:27]
  wire        _dmInner_auto_dmi_in_a_ready;	// @[Debug.scala:1847:27]
  wire        _dmInner_auto_dmi_in_d_valid;	// @[Debug.scala:1847:27]
  wire [2:0]  _dmInner_auto_dmi_in_d_bits_opcode;	// @[Debug.scala:1847:27]
  wire [1:0]  _dmInner_auto_dmi_in_d_bits_size;	// @[Debug.scala:1847:27]
  wire        _dmInner_auto_dmi_in_d_bits_source;	// @[Debug.scala:1847:27]
  wire [31:0] _dmInner_auto_dmi_in_d_bits_data;	// @[Debug.scala:1847:27]
  TLDebugModuleInner dmInner (	// @[Debug.scala:1847:27]
    .clock                          (io_debug_clock),
    .reset                          (io_debug_reset),
    .auto_tl_in_a_valid             (auto_dmInner_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode       (auto_dmInner_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param        (auto_dmInner_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size         (auto_dmInner_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source       (auto_dmInner_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address      (auto_dmInner_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask         (auto_dmInner_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data         (auto_dmInner_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt      (auto_dmInner_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready             (auto_dmInner_tl_in_d_ready),
    .auto_dmi_in_a_valid            (_dmiXing_auto_out_a_valid),	// @[Debug.scala:1848:27]
    .auto_dmi_in_a_bits_opcode      (_dmiXing_auto_out_a_bits_opcode),	// @[Debug.scala:1848:27]
    .auto_dmi_in_a_bits_param       (_dmiXing_auto_out_a_bits_param),	// @[Debug.scala:1848:27]
    .auto_dmi_in_a_bits_size        (_dmiXing_auto_out_a_bits_size),	// @[Debug.scala:1848:27]
    .auto_dmi_in_a_bits_source      (_dmiXing_auto_out_a_bits_source),	// @[Debug.scala:1848:27]
    .auto_dmi_in_a_bits_address     (_dmiXing_auto_out_a_bits_address),	// @[Debug.scala:1848:27]
    .auto_dmi_in_a_bits_mask        (_dmiXing_auto_out_a_bits_mask),	// @[Debug.scala:1848:27]
    .auto_dmi_in_a_bits_data        (_dmiXing_auto_out_a_bits_data),	// @[Debug.scala:1848:27]
    .auto_dmi_in_a_bits_corrupt     (_dmiXing_auto_out_a_bits_corrupt),	// @[Debug.scala:1848:27]
    .auto_dmi_in_d_ready            (_dmiXing_auto_out_d_ready),	// @[Debug.scala:1848:27]
    .io_dmactive                    (_dmactive_synced_dmactive_synced_dmactiveSync_io_q),	// @[ShiftReg.scala:45:23]
    .io_innerCtrl_valid             (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_valid),	// @[AsyncQueue.scala:207:22]
    .io_innerCtrl_bits_resumereq    (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_resumereq),	// @[AsyncQueue.scala:207:22]
    .io_innerCtrl_bits_hartsel      (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hartsel),	// @[AsyncQueue.scala:207:22]
    .io_innerCtrl_bits_ackhavereset (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_ackhavereset),	// @[AsyncQueue.scala:207:22]
    .io_innerCtrl_bits_hrmask_0     (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hrmask_0),	// @[AsyncQueue.scala:207:22]
    .io_hartIsInReset_0             (io_hartIsInReset_0),
    .auto_tl_in_a_ready             (auto_dmInner_tl_in_a_ready),
    .auto_tl_in_d_valid             (auto_dmInner_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode       (auto_dmInner_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size         (auto_dmInner_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source       (auto_dmInner_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data         (auto_dmInner_tl_in_d_bits_data),
    .auto_dmi_in_a_ready            (_dmInner_auto_dmi_in_a_ready),
    .auto_dmi_in_d_valid            (_dmInner_auto_dmi_in_d_valid),
    .auto_dmi_in_d_bits_opcode      (_dmInner_auto_dmi_in_d_bits_opcode),
    .auto_dmi_in_d_bits_size        (_dmInner_auto_dmi_in_d_bits_size),
    .auto_dmi_in_d_bits_source      (_dmInner_auto_dmi_in_d_bits_source),
    .auto_dmi_in_d_bits_data        (_dmInner_auto_dmi_in_d_bits_data),
    .io_hgDebugInt_0                (io_hgDebugInt_0)
  );
  TLAsyncCrossingSink dmiXing (	// @[Debug.scala:1848:27]
    .clock                         (io_debug_clock),
    .reset                         (io_debug_reset),
    .auto_in_a_mem_0_opcode        (auto_dmiXing_in_a_mem_0_opcode),
    .auto_in_a_mem_0_param         (auto_dmiXing_in_a_mem_0_param),
    .auto_in_a_mem_0_size          (auto_dmiXing_in_a_mem_0_size),
    .auto_in_a_mem_0_source        (auto_dmiXing_in_a_mem_0_source),
    .auto_in_a_mem_0_address       (auto_dmiXing_in_a_mem_0_address),
    .auto_in_a_mem_0_mask          (auto_dmiXing_in_a_mem_0_mask),
    .auto_in_a_mem_0_data          (auto_dmiXing_in_a_mem_0_data),
    .auto_in_a_mem_0_corrupt       (auto_dmiXing_in_a_mem_0_corrupt),
    .auto_in_a_widx                (auto_dmiXing_in_a_widx),
    .auto_in_a_safe_widx_valid     (auto_dmiXing_in_a_safe_widx_valid),
    .auto_in_a_safe_source_reset_n (auto_dmiXing_in_a_safe_source_reset_n),
    .auto_in_d_ridx                (auto_dmiXing_in_d_ridx),
    .auto_in_d_safe_ridx_valid     (auto_dmiXing_in_d_safe_ridx_valid),
    .auto_in_d_safe_sink_reset_n   (auto_dmiXing_in_d_safe_sink_reset_n),
    .auto_out_a_ready              (_dmInner_auto_dmi_in_a_ready),	// @[Debug.scala:1847:27]
    .auto_out_d_valid              (_dmInner_auto_dmi_in_d_valid),	// @[Debug.scala:1847:27]
    .auto_out_d_bits_opcode        (_dmInner_auto_dmi_in_d_bits_opcode),	// @[Debug.scala:1847:27]
    .auto_out_d_bits_size          (_dmInner_auto_dmi_in_d_bits_size),	// @[Debug.scala:1847:27]
    .auto_out_d_bits_source        (_dmInner_auto_dmi_in_d_bits_source),	// @[Debug.scala:1847:27]
    .auto_out_d_bits_data          (_dmInner_auto_dmi_in_d_bits_data),	// @[Debug.scala:1847:27]
    .auto_in_a_ridx                (auto_dmiXing_in_a_ridx),
    .auto_in_a_safe_ridx_valid     (auto_dmiXing_in_a_safe_ridx_valid),
    .auto_in_a_safe_sink_reset_n   (auto_dmiXing_in_a_safe_sink_reset_n),
    .auto_in_d_mem_0_opcode        (auto_dmiXing_in_d_mem_0_opcode),
    .auto_in_d_mem_0_param         (auto_dmiXing_in_d_mem_0_param),
    .auto_in_d_mem_0_size          (auto_dmiXing_in_d_mem_0_size),
    .auto_in_d_mem_0_source        (auto_dmiXing_in_d_mem_0_source),
    .auto_in_d_mem_0_sink          (auto_dmiXing_in_d_mem_0_sink),
    .auto_in_d_mem_0_denied        (auto_dmiXing_in_d_mem_0_denied),
    .auto_in_d_mem_0_data          (auto_dmiXing_in_d_mem_0_data),
    .auto_in_d_mem_0_corrupt       (auto_dmiXing_in_d_mem_0_corrupt),
    .auto_in_d_mem_0_hit           (auto_dmiXing_in_d_mem_0_hit),
    .auto_in_d_widx                (auto_dmiXing_in_d_widx),
    .auto_in_d_safe_widx_valid     (auto_dmiXing_in_d_safe_widx_valid),
    .auto_in_d_safe_source_reset_n (auto_dmiXing_in_d_safe_source_reset_n),
    .auto_out_a_valid              (_dmiXing_auto_out_a_valid),
    .auto_out_a_bits_opcode        (_dmiXing_auto_out_a_bits_opcode),
    .auto_out_a_bits_param         (_dmiXing_auto_out_a_bits_param),
    .auto_out_a_bits_size          (_dmiXing_auto_out_a_bits_size),
    .auto_out_a_bits_source        (_dmiXing_auto_out_a_bits_source),
    .auto_out_a_bits_address       (_dmiXing_auto_out_a_bits_address),
    .auto_out_a_bits_mask          (_dmiXing_auto_out_a_bits_mask),
    .auto_out_a_bits_data          (_dmiXing_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt       (_dmiXing_auto_out_a_bits_corrupt),
    .auto_out_d_ready              (_dmiXing_auto_out_d_ready)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0 dmactive_synced_dmactive_synced_dmactiveSync (	// @[ShiftReg.scala:45:23]
    .clock (io_debug_clock),
    .reset (io_debug_reset),
    .io_d  (io_dmactive),
    .io_q  (_dmactive_synced_dmactive_synced_dmactiveSync_io_q)
  );
  AsyncQueueSink_4 dmactive_synced_dmInner_io_innerCtrl_sink (	// @[AsyncQueue.scala:207:22]
    .clock                        (io_debug_clock),
    .reset                        (io_debug_reset),
    .io_async_mem_0_resumereq     (io_innerCtrl_mem_0_resumereq),
    .io_async_mem_0_hartsel       (io_innerCtrl_mem_0_hartsel),
    .io_async_mem_0_ackhavereset  (io_innerCtrl_mem_0_ackhavereset),
    .io_async_mem_0_hasel         (io_innerCtrl_mem_0_hasel),
    .io_async_mem_0_hamask_0      (io_innerCtrl_mem_0_hamask_0),
    .io_async_mem_0_hrmask_0      (io_innerCtrl_mem_0_hrmask_0),
    .io_async_widx                (io_innerCtrl_widx),
    .io_async_safe_widx_valid     (io_innerCtrl_safe_widx_valid),
    .io_async_safe_source_reset_n (io_innerCtrl_safe_source_reset_n),
    .io_deq_valid                 (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_valid),
    .io_deq_bits_resumereq        (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_resumereq),
    .io_deq_bits_hartsel          (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hartsel),
    .io_deq_bits_ackhavereset     (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_ackhavereset),
    .io_deq_bits_hrmask_0         (_dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hrmask_0),
    .io_async_ridx                (io_innerCtrl_ridx),
    .io_async_safe_ridx_valid     (io_innerCtrl_safe_ridx_valid),
    .io_async_safe_sink_reset_n   (io_innerCtrl_safe_sink_reset_n)
  );
endmodule

