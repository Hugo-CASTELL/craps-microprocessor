// init
set rst 1
set rst 0
set clk 0

// %r1 <- 2
set areg[4..0] 10100
set breg[4..0] 10100
set dreg[4..0] 00001
set cmd_ual[5..0] 000000
set oe_mem 0
set write 0
set switches[15..0] 0000000000000000
check dbus[31..0] 00000000000000000000000000000010
set clk 1
set clk 0

// check that %r1 == 2
set areg[4..0] 00001
set breg[4..0] 00000
set dreg[4..0] 00000
check dbus[31..0] 00000000000000000000000000000010

// mem[2] <- 1
set breg[4..0] 10100
set cmd_ual[5..0] 101000
set write 1
set clk 1
set clk 0

// check that mem[2] == 1
set areg[4..0] 00001
set cmd_ual[5..0] 000000
set write 0
set oe_mem 1
check dbus[31..0] 00000000000000000000000000000001

// check NZVC with subcc 0-1
set areg[4..0] 00000
set breg[4..0] 10100
set cmd_ual[5..0] 010100
set oe_mem 0
check dbus[31..0] 11111111111111111111111111111111
check N 0
check Z 0
check V 0
check C 0
set clk 1
set clk 0
check N 1
check Z 0
check V 0
check C 1
