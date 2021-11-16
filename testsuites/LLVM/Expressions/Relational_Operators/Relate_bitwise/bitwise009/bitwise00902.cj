// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let p: Int8 = -30
    let q = p << 2
    let r = p >> 2
    let x : UInt8 = 30
    let b1 = x << Int64(3)
    let b2 = x >> Int32(1)

    if (q !=-120) {
        return 1
    }
    if (r != -8) {
        return 1
    }
    if (b1 != 240) {
        return 1
    }
    if (b2 != 15) {
        return 1
    }
    return 0
}