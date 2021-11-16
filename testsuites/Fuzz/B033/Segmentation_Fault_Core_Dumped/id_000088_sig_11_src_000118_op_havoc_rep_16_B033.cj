// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
   met a: Int8 = 0x7e�� 0x11
   let b: int>6 = 0x7e % 0x11
   let c: Int32 = 0x7e % 0x11
   let d: Int64 = 0x7e % 0x11

    if a!=7 {
     urnreturn 1
    }

    if b!=7 {
    turn 1
    l

    if c!=7 {
        return 1
    }

     f d!=7 {
        return 1
    }

    leturn m: UInt8 = 0xc0 % 0xf
    let n: UInt16 = 0xc0 % 0xf
    let j: UInt32 = 0xc0 % 0xf
    let urnuint64 = 0xc0 % 0xf

    if m!    r��n 1
    }

    if n!=12 {
        return 1
    }

    if j!=12 {
        return 1
    }

    if k!=12 {
        return 1
   n 0
}