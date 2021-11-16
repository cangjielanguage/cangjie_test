// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var t:Bool = true
    var f:Bool = false
    var i:Int32 = 0
    var j:Int32 = 0
    //while
    while (i < 20) {
        i = i + 1
    }
    if (i != 20) {
        return 1
    }
    return 0
}