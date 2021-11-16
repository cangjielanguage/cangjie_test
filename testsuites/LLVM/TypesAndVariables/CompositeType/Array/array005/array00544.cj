// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var lambda = { input:Array<Int64> => input}
    var a = @{1,0}
    return lambda(a)[1]
}
