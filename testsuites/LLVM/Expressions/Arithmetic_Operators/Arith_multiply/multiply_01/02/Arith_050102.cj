// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a: Int16 = 127
    *128
    let b: Int16 = 127*
    128
    let c: Int16 = 127
    *
    128


    if (a!=16256) {
        return 1
    }

    if (b!=16256) {
        return 1
    }

    if (c!=16256) {
        return 1
    }


    return 0
}