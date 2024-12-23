// addcc  %r20, %r20, %r2
// subcc    %r2, 123, %r4
// voir calc.rom

set rst 0
set rst 1
set rst 0
set clk 0

// addcc  %r20, %r20, %r2
// fetch -> decode
check areg[4..0] 11110
check dreg[4..0] 11111
check cmd_ual[5..0] 000000
check oe_mem 1
check write 0
check dbus[31..0] 10000100100001010000000000010100
check N 0
check Z 0
check V 0
check C 0
set clk 1
set clk 0
// decode -> pcplus1
check areg[4..0] 10100
check breg[4..0] 10100
check dreg[4..0] 00010
check cmd_ual[5..0] 010000
check oe_mem 0
check write 0
check dbus[31..0] 00000000000000000000000000000010
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

// subcc %r2, 123, %r4
// fetch -> decode
check areg[4..0] 11110
check dreg[4..0] 11111
check cmd_ual[5..0] 000000
check oe_mem 1
check write 0
check dbus[31..0] 10001000101000001010000001111011
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
check dbus[31..0] 00000000000000000000000001111011
set clk 1
set clk 0
// calc_imm -> pcplus1
check areg[4..0] 00010
check breg[4..0] 10101
check dreg[4..0] 00100
check cmd_ual[5..0] 010100
check dbus[31..0] 11111111111111111111111110000111
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
check C 1
set clk 1
set clk 0
