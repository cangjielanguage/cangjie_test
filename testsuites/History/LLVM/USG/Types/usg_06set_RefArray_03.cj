// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    let a : RefArray<Int64> = RefArray<Int64>(5, {i => i})
    return 0
}