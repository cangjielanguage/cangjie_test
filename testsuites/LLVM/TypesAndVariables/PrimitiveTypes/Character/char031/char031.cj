// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var varChar : Char = if(2 < 1) {'1'} else {'2'}
    let letChar : Char = if(2 > 1) {'2'} else {'1'}
    if (varChar != '2') {
        return 1
    }
    if (varChar != letChar) {
        return 1
    }
    return 0
}
