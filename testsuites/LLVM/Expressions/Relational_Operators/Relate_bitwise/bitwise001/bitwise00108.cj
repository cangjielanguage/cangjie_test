// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int16 = 0xa8b
    var b:Int16 = 0
    var c:Int16 = -2700
    b = !a
    if (b != c) {
        return 1
    }
    return 0 
}