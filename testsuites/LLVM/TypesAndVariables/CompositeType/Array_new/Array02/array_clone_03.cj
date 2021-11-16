// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    let arr : Array<Int64> = Array<Int64>()
    let b = arr.clone()
    return arr.size() + b.size()
}