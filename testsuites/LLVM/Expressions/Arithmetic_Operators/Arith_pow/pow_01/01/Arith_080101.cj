// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a: Int16 = 2**10
    let b: Int16 = 2 **10
    let c: Int16 = 2** 10
    let d: Int16 = 2 ** 10

    if (a!=1024) {
        return 1
    }

    if (b!=1024) {
        return 1
    }

    if (c!=1024) {
        return 1
    }

    if (d!=1024) {
        return 1
    }

    return 0
}