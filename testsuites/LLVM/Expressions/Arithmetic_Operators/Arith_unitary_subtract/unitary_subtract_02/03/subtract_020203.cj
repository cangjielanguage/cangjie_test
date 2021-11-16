// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
   let a: Int8 =-0o200
   let b: Int16 = -0o100000
   let c: Int32 = -0o20000000000
   let d: Int64 = -0o1000000000000000000000

    if (a!=-128) {
        return 1
    }

    if (b!=-32768) {
        return 1
    }

    if (c!=-2147483648) {
        return 1
    }

    if (d!=-9223372036854775808) {
        return 1
    }

    return 0
}
