// addcc
set cmd[5..0] 010000
set a[31..0] 00000000000000000000000000000010
set b[31..0] 00000000000000000000000000000011
check s[31..0] 00000000000000000000000000000101
check enN 1
check enZ 1
check enVC 1
check N 0
check Z 0
check V 0
check C 0

// add
set cmd[5..0] 000000
check s[31..0] 00000000000000000000000000000101
check enN 0
check enZ 0
check enVC 0

// subcc
set cmd[5..0] 010100
check s[31..0] 11111111111111111111111111111111
check enN 1
check enZ 1
check enVC 1
check N 1
check Z 0
check V 0
check C 1

// sub
set cmd[5..0] 000100
check s[31..0] 11111111111111111111111111111111
check enN 0
check enZ 0
check enVC 0

// andcc
set cmd[5..0] 010001
check s[31..0] 00000000000000000000000000000010
check enN 1
check enZ 1
check enVC 0
check N 0
check Z 0
check V 0
check C 0

// and
set cmd[5..0] 000001
check s[31..0] 00000000000000000000000000000010
check enN 0
check enZ 0
check enVC 0

// orcc
set cmd[5..0] 010010
check s[31..0] 00000000000000000000000000000011
check enN 1
check enZ 1
check enVC 0
check N 0
check Z 0
check V 0
check C 0

// or
set cmd[5..0] 000010
check s[31..0] 00000000000000000000000000000011
check enN 0
check enZ 0
check enVC 0

// xorcc
set cmd[5..0] 010011
check s[31..0] 00000000000000000000000000000001
check enN 1
check enZ 1
check enVC 0
check N 0
check Z 0
check V 0
check C 0

// xor
set cmd[5..0] 000011
check s[31..0] 00000000000000000000000000000001
check enN 0
check enZ 0
check enVC 0

// signext13
set cmd[5..0] 100000
set a[31..0] 00000000000000000001000000000010
check s[31..0] 11111111111111111111000000000010

// signext25
set cmd[5..0] 100001
set a[31..0] 00000001000000000000000000000010
check s[31..0] 11111111000000000000000000000010

// sethi
set cmd[5..0] 100011
set a[31..0] 11000001000000000000000000001110
check s[31..0] 00000000000000000000111000000000

// nopb
set cmd[5..0] 101000
set b[31..0] 11000001000000000000000000001110
check s[31..0] 11000001000000000000000000001110
