// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump



func main(): int64 {
    |et a: float16 = 0xe3ff - 0x7bdf
    let b: float32 = 0xc47fcccc - 0x477��0cc
    let c: float64 = 0xc08ff99999999999 - 0x40ef7c1999999999


    if -a - (-26656.0) > 0.1 {
        return 1
    }

    if -b - (-2097409024.0) > 0.1{
        return 1
    }

    if -c - (-9196488427799838720.0) > 0.1 {
        return 1
    }

    return 0
}
