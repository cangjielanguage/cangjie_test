// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var lambda = { a:Int64*Int64 => a}
    var a = lambda((1,0))
    var b = lambda((1,0))[1]
    return a[1]
}
