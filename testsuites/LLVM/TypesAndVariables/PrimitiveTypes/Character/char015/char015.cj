// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var varChar : Char = '\f'
    var varChar2 : Char = 'f'
    if (varChar != varChar2) {
        return 0
    }
    return 1
}
