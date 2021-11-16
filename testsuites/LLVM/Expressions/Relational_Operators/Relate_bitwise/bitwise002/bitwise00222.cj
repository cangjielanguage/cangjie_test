// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int64 = 8
    a = 1 << 2**6-1
    a = 1 >> 2**6-1
    return 0 
}