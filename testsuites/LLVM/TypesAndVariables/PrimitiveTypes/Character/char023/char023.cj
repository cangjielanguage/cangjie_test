// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var varChar : Char = '\"'
    var varChar2 : Char = '"'
    if (varChar != varChar2) {
        return 1
    }
    return 0
}
