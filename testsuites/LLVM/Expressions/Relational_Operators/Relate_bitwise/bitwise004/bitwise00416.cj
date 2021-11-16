// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int64 = 10
    var b:Int64 = 0
    b = a ^ a   
    return b
}