// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a: Int16 = 128
    -129

    let b: Int16 = 128-
    129
    if (a != 128) {
        return 1
    }

    if (b != -1) {
        return 1
    }
    return 0
}
