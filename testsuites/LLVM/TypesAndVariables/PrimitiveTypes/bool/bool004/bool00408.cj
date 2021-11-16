// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
//boolean operators
// troubleshooting
func main(): Int64 {
    var t:Bool = true
    var f:Bool = false
    f ||= f
    if (f != false) {
    return 1
    }
    t ||= t
    if (t == false) {
    return 1
    }
    t ||= f
    if (t == false) {
    return 1
    }
    f ||= t
    if (f == false) {
    return 1
    }
    return 0 ////STATUS_PASSED
}
