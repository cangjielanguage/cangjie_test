// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var setOne = #{Int32(1),Int64(1)} // EXPECTED: regex inconsistent element type for Set literal
    return 0
}
