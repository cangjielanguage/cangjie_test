// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var range1 = 10..-10:-1
    var range2 = -10..10:1
    var range3 = 10..-10:1
    var rangeTuple = (range1,range2,range3)
    return 0
}
