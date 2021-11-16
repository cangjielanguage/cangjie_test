// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    let int32_let_A: Int32 = 214_748_36_4_6

    if (int32_let_A != 2147483646) {
        return 1
    }

    return 0
}
