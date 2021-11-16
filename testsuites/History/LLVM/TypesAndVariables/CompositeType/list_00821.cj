// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var a : Map<List<Int64>,List<Int64>> =#{[1]:[1]} // EXPECTED: regex error.*?generics type arguments do not match the constraint
    return 1
}
