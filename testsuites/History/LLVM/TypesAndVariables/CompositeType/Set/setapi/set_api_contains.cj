 // EXEC: %compiler %cmp_opt %f -o %output
 // EXEC: %run %run_opt %output %run_args

var setOne: Set<Int64> = #{1,2,3,3}
func main(): Int64 {
    if (setOne.contains(1) && setOne.contains(2) && setOne.contains(3)) {
        return 0
    }
    return 1
}