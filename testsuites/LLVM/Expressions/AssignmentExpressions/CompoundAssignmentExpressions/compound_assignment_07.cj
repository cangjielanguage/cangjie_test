// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64{
    var a = 5
    var b = 10
    a **= b
    a *= b
    a /= b
    a %= b
    a += b
    a -= b
    a <<= b
    a >>= b
    a &= b
    a ^= b
    a |= b

    if (a==10) {
        return 0
    }
    return 1
}