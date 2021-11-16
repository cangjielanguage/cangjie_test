// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
//boolean operators
func main(): Int64 {
    var t:Bool = true
    var f:Bool = false
    if (!(t&&t)) {
    return 1
    }
    if (t&&f) {
    return 1
    }
    if (f&&t) {
    return 1
    }
    if (f&&f) {
    return 1
    }
    return 0 ////STATUS_PASSED
}
