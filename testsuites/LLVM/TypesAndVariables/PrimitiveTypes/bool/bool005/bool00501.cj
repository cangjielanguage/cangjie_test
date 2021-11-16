// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var t:Bool = true
    var f:Bool = false
    if (t) {
        return 0    /* STATUS_FAILED */
    }
    else{
        return 1
            }
}