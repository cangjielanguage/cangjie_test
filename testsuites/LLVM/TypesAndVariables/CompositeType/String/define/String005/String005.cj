// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex \\22\\00
func main(): Int64 {
    var varString : String = "\""
    return 0
}
