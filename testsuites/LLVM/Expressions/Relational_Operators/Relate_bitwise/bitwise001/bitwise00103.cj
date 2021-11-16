// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int16 = -32768
    var b:Int16 = 0
    var c:Int16 = 32767
    b = !a
    if (b != c) {
        return 1
    }
    return 0 
}