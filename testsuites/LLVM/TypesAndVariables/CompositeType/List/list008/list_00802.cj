// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a = [1,2,3]
    var b = [1,2,3]
    return a.size() + b.size() - 6
}
