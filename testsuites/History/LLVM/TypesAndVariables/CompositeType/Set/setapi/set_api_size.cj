 // EXEC: %compiler %cmp_opt %f -o %output
 // EXEC: %run %run_opt %output %run_args

var setOne: Set<Int64> = #{1,2,3,3}
var set2: Set<Int64> = #{}
func main(): Int64 {
    if (setOne.size() != 3) {
        return 1
    }
    if (set2.size() != 0) {
        return 2
    }
    return 0
}