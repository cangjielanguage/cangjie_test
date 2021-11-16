 // EXEC: %compiler %cmp_opt %f -o %output
 // EXEC: %run %run_opt %output %run_args

var setOne: Set<Int64> = #{}
func main(): Int64 {
    if (setOne.isEmpty()) {
        return 0
    }
    return 1
}