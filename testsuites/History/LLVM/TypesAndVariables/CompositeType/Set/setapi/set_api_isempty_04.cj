// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var set: Set<Int64> = #{1, 2, 3, 3}
    if (!set.isEmpty(/)) {  // EXPECTED: regex extra argument given for call with parameter list
        return 0
    }
    return 1
}