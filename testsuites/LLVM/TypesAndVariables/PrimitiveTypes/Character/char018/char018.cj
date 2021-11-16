// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var varChar : Char = '\r'
    var varChar2 : Char = 'r'
    if (varChar != varChar2) {
        return 0
    }
    return 1
}
