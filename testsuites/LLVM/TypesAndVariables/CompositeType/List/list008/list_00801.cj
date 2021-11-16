// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

let a = [1,2,3]
var b = [1,2,3]

func main(): Int64 {
    return a.size() + b.size() - 6
}
