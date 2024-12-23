// debut: subcc %r0, 1, %r0
//        bne  la
// ici:   bcc  debut
// la:    ba   ici
//
// voir branch.rom

set rst 0
set rst 1
set rst 0
set clk 0

// subcc %r0, 1, %r0
// fetch -> decode
check areg[4..0] 11110
check dreg[4..0] 11111
check cmd_ual[5..0] 000000
check oe_mem 1
check write 0
check dbus[31..0] 10000000101000000010000000000001
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
check dbus[31..0] 00000000000000000000000000000001
set clk 1
set clk 0
// calc_imm -> pcplus1
check areg[4..0] 00000
check breg[4..0] 10101
check dreg[4..0] 00000
check cmd_ual[5..0] 010100
check dbus[31..0] 11111111111111111111111111111111
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

// bne la
// fetch -> decode
check areg[4..0] 11110
check dreg[4..0] 11111
check cmd_ual[5..0] 000000
check oe_mem 1
check write 0
check dbus[31..0] 00110010000000000000000000000010
check N 1
check Z 0
check V 0
check C 1
set clk 1
set clk 0
// decode -> branch
check areg[4..0] 11111
check dreg[4..0] 10101
check cmd_ual[5..0] 100001
check oe_mem 0
check write 0
check N 1
check Z 0
check V 0
check C 1
check dbus[31..0] 00000000000000000000000000000010
set clk 1
set clk 0
// branch -> fetch
check areg[4..0] 11110
check breg[4..0] 10101
check dreg[4..0] 11110
check cmd_ual[5..0] 000000
check oe_mem 0
check write 0
check N 1
check Z 0
check V 0
check C 1
check dbus[31..0] 00000000000000000000000000000011
set clk 1
set clk 0

// ba ici
// fetch -> decode
check areg[4..0] 11110
check dreg[4..0] 11111
check cmd_ual[5..0] 000000
check oe_mem 1
check write 0
check dbus[31..0] 00110001111111111111111111111111
check N 1
check Z 0
check V 0
check C 1
set clk 1
set clk 0
// decode -> branch
check areg[4..0] 11111
check dreg[4..0] 10101
check cmd_ual[5..0] 100001
check oe_mem 0
check write 0
check N 1
check Z 0
check V 0
check C 1
check dbus[31..0] 11111111111111111111111111111111
set clk 1
set clk 0
// branch -> fetch
check areg[4..0] 11110
check breg[4..0] 10101
check dreg[4..0] 11110
check cmd_ual[5..0] 000000
check oe_mem 0
check write 0
check N 1
check Z 0
check V 0
check C 1
check dbus[31..0] 00000000000000000000000000000010
set clk 1
set clk 0

// bcc debut
// fetch -> decode
check areg[4..0] 11110
check dreg[4..0] 11111
check cmd_ual[5..0] 000000
check oe_mem 1
check write 0
check dbus[31..0] 00111011111111111111111111111110
check N 1
check Z 0
check V 0
check C 1
set clk 1
set clk 0
// decode -> fetch
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
