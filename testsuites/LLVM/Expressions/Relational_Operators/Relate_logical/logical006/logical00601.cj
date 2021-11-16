// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var t:Bool = true
    var f:Bool = false
    if (f && !t) {
        return 1
    }
    if (!f && t) {
        return 0 
    }
    return 0
}