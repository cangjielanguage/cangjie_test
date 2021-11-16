// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var varChar : Char = '1'
    let letChar : Char = '2'
    if (varChar > letChar) {
        return 1
    }
    if (varChar >= letChar) {
        return 2
    }
    if (varChar == letChar) {
        return 3
    }
    if (varChar != letChar) {
        if (varChar <= letChar) {
            if (varChar < letChar) {
                return 0
            }
        }
    }
    return 1
}
