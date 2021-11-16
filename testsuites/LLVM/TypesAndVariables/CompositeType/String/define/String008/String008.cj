// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var varString : String = "\\"
    var varString2 : String = "\u{005C}"
    if (varString != varString2) {
        return 1
    }
    return 0
}
