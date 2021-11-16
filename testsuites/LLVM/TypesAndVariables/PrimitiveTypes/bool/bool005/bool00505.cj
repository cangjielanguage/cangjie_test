// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var t:Bool = true
    var f:Bool = false
    var j:Int32 = 0
    do {
        j = j + 1
    } while (j < 20)
    if (j != 20) {
        return 1
    }
    return 0
}