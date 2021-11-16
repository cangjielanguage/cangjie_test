// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): int64 {
    let b: float32 = 0x��7fcccc - 0x477be0cc
    let c: float64 = -1023.2 - 0x40ef7c1999999999

    if b - (-50074624) > 0.1{
        return 1
    }

    if c - (-4679094987254242304) > 0.1 {
        return 2
    }

    return 0
}
