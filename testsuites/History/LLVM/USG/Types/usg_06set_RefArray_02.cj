// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    let a : RefArray<Int64> = RefArray<Int64>([1, 2, 3, 4, 5])
    return 0
}