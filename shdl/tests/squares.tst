// SW = 0x90000000 // switches I/O address
// LD = 0xB0000000 // leds I/O address
//            set    SW, %r8
//            set    LD, %r9
// loop:      ld     [%r8+%r0], %r1
//            addcc  %r1, %r1, %r2
//            st     %r2, [%r9+%r0]
//            ba     loop
           
set rst 0
set rst 1
set rst 0
set clk 0
set switches[15..0] 0000000000000011

// sethi 0x9000, %r8
// fetch -> decode
check areg[4..0] 11110
check dreg[4..0] 11111
check cmd_ual[5..0] 000000
check oe_mem 1
check write 0
check dbus[31..0] 00001000100100000000000000000000
check N 0
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// decode -> pcplus1
check areg[4..0] 11111
check dreg[4..0] 01000
check cmd_ual[5..0] 100011
check oe_mem 0
check write 0
check dbus[31..0] 10010000000000000000000000000000
check N 0
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// pcplus1 -> fetch
check areg[4..0] 11110
check breg[4..0] 10100
check dreg[4..0] 11110
check cmd_ual[5..0] 000000
check oe_mem 0
check write 0
check N 0
check Z 0
check V 0
check C 0
set clk 1
set clk 0

// orcc %r8, 0x00, %r8
// fetch -> decode
check areg[4..0] 11110
check dreg[4..0] 11111
check cmd_ual[5..0] 000000
check oe_mem 1
check write 0
check dbus[31..0] 10010000100100100010000000000000
check N 0
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// decode -> calc_imm
check areg[4..0] 11111
check dreg[4..0] 10101
check cmd_ual[5..0] 100000
check oe_mem 0
check write 0
check N 0
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// calc_imm -> pcplus1
check areg[4..0] 01000
check breg[4..0] 10101
check dreg[4..0] 01000
check cmd_ual[5..0] 010010
check oe_mem 0
check write 0
check N 0
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// pcplus1 -> fetch
check areg[4..0] 11110
check breg[4..0] 10100
check dreg[4..0] 11110
check cmd_ual[5..0] 000000
check oe_mem 0
check write 0
check N 1
check Z 0
check V 0
check C 0
set clk 1
set clk 0

// sethi 0xb000, %r9
// fetch -> decode
check areg[4..0] 11110
check dreg[4..0] 11111
check cmd_ual[5..0] 000000
check oe_mem 1
check write 0
check dbus[31..0] 00001001101100000000000000000000
check N 1
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// decode -> pcplus1
check areg[4..0] 11111
check dreg[4..0] 01001
check cmd_ual[5..0] 100011
check oe_mem 0
check write 0
check N 1
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// pcplus1 -> fetch
check areg[4..0] 11110
check breg[4..0] 10100
check dreg[4..0] 11110
check cmd_ual[5..0] 000000
check oe_mem 0
check write 0
check N 1
check Z 0
check V 0
check C 0
set clk 1
set clk 0

// orcc %r9, 0x00, %r9
// fetch -> decode
check areg[4..0] 11110
check dreg[4..0] 11111
check cmd_ual[5..0] 000000
check oe_mem 1
check write 0
check dbus[31..0] 10010010100100100110000000000000
check N 1
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// decode -> calc_imm
check areg[4..0] 11111
check dreg[4..0] 10101
check cmd_ual[5..0] 100000
check oe_mem 0
check write 0
check N 1
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// calc_imm -> pcplus1
check areg[4..0] 01001
check breg[4..0] 10101
check dreg[4..0] 01001
check cmd_ual[5..0] 010010
check oe_mem 0
check write 0
check N 1
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// pcplus1 -> fetch
check areg[4..0] 11110
check breg[4..0] 10100
check dreg[4..0] 11110
check cmd_ual[5..0] 000000
check oe_mem 0
check write 0
check N 1
check Z 0
check V 0
check C 0
set clk 1
set clk 0

// ld [%r8+%r0], %r1
// fetch -> decode
check areg[4..0] 11110
check dreg[4..0] 11111
check cmd_ual[5..0] 000000
check oe_mem 1
check write 0
check dbus[31..0] 11000010000000100000000000000000
check N 1
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// decode -> addr
check areg[4..0] 01000
check breg[4..0] 00000
check dreg[4..0] 10101
check cmd_ual[5..0] 000000
check oe_mem 0
check write 0
check N 1
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// addr -> pcplus1
check areg[4..0] 10101
check dreg[4..0] 00001
check oe_mem 1
check write 0
check N 1
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// pcplus1 -> fetch
check areg[4..0] 11110
check breg[4..0] 10100
check dreg[4..0] 11110
check cmd_ual[5..0] 000000
check oe_mem 0
check write 0
check N 1
check Z 0
check V 0
check C 0
set clk 1
set clk 0

// addcc %r1, %r1, %r2
// fetch -> decode
check areg[4..0] 11110
check dreg[4..0] 11111
check cmd_ual[5..0] 000000
check oe_mem 1
check write 0
check dbus[31..0] 10000100100000000100000000000001
check N 1
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// decode -> pcplus1
check areg[4..0] 00001
check breg[4..0] 00001
check dreg[4..0] 00010
check cmd_ual[5..0] 010000
check oe_mem 0
check write 0
check N 1
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// pcplus1 -> fetch
check areg[4..0] 11110
check breg[4..0] 10100
check dreg[4..0] 11110
check cmd_ual[5..0] 000000
check oe_mem 0
check write 0
check N 0
check Z 0
check V 0
check C 0
set clk 1
set clk 0

// st %r2, [%r9+%r0]
// fetch -> decode
check areg[4..0] 11110
check dreg[4..0] 11111
check cmd_ual[5..0] 000000
check oe_mem 1
check write 0
check dbus[31..0] 11000100001000100100000000000000
check N 0
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// decode -> addr
check areg[4..0] 01001
check breg[4..0] 00000
check dreg[4..0] 10101
check cmd_ual[5..0] 000000
check oe_mem 0
check write 0
check N 0
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// addr -> pcplus1
check areg[4..0] 10101
check breg[4..0] 00010
check dreg[4..0] 00000
check cmd_ual[5..0] 101000
check oe_mem 0
check write 1
check N 0
check Z 0
check V 0
check C 0
set clk 1
set clk 0
check leds[15..0] 0000000000000110
// pcplus1 -> fetch
check areg[4..0] 11110
check breg[4..0] 10100
check dreg[4..0] 11110
check cmd_ual[5..0] 000000
check oe_mem 0
check write 0
check N 0
check Z 0
check V 0
check C 0
set clk 1
set clk 0

// ba loop
// fetch -> decode
check areg[4..0] 11110
check dreg[4..0] 11111
check cmd_ual[5..0] 000000
check oe_mem 1
check write 0
check dbus[31..0] 00110001111111111111111111111101
check N 0
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// decode -> branch
check areg[4..0] 11111
check dreg[4..0] 10101
check cmd_ual[5..0] 100001
check oe_mem 0
check write 0
check N 0
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// branch -> fetch
check areg[4..0] 11110
check breg[4..0] 10101
check dreg[4..0] 11110
check cmd_ual[5..0] 000000
check oe_mem 0
check write 0
check N 0
check Z 0
check V 0
check C 0
set clk 1
set clk 0
