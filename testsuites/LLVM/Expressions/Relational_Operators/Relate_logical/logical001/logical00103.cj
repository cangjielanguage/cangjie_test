// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    if (!(1<2)) {
        return 1
    }
    return 0 
}