// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var b: List<Int64> = [1] 
    var a : Set<List<Int64>> = #{[1]} // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var c : Set<List<Int64>> = #{b} // EXPECTED: regex error.*?generics type arguments do not match the constraint
    return 0
}
