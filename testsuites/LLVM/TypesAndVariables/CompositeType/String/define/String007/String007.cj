// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var varString : String = "\u{1}"
    return 0
}
