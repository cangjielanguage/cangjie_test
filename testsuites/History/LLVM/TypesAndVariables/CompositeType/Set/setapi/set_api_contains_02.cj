 // EXEC: %compiler %cmp_opt %f -o %output
 // EXEC: %run %run_opt %output %run_args

var setOne = Set<Int64>()
func main(): Int64 {
    if (setOne.contains(1)) {
        return 1
    }
    return 0
}