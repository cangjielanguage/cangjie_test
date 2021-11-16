// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a1 = Array<Int8>([])
    a1.sort()
    return a1.size()
}
