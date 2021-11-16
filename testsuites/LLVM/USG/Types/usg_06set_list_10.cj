// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var li = [0, 1, 2]
    li[0] = 2 // EXPECTED: regex-auto type Class-List<Int64> does not have operator func [](index, value)
    return 0
}
