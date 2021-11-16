// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    if (false && false) {
        return 1
    }
    if (false && true) {
        return 1
    }
    if (true && true) {
        return 0 
    }
    return 0 
}