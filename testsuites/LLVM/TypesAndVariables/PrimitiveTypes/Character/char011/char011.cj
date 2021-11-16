// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var varChar : Char = '我'
    if (varChar != '我') {  // should change to \u6211
        return 1
    }
    return 0
}
