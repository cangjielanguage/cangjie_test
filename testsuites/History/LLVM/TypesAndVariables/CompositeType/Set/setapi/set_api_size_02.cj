// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

var setOne: Set<Int64> = #{1,2,3,3}
func main(): Int64 {
    if (setOne.size("1") == 3) {   // EXPECTED: regex extra argument given for call with parameter list
        return 0
    }
    return 1
}