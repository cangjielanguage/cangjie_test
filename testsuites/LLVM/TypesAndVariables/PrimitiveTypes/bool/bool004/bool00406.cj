// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var t:Bool = true
    var f:Bool = false
    f &&= t
    if (f != false) {
    return 4
    }
    t &&= t
    if (t != true) {
    return 3
    }
    f &&= f
    if (f != false) {
    return 2
    }
    t &&= f
    if (t != false) {
    return 1
    }
    return 0 ////STATUS_PASSED
}