// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
   let a: Int8 =-0x80
   let b: Int16 = -0x8000
   let c: Int32 = -0x80000000
   let d: Int64 = -0x8000000000000000

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