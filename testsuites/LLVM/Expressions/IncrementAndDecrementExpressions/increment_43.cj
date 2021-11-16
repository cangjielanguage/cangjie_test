// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var list0:List<List<Int64>>= [[1, 2, 3, 4], [5, 6, 7]]
    list0[0][0]++ // EXPECTED: regex-auto 'Class-List<Int64>' is unsupported for this increment or decrement expression
    list0[0][0]-- // EXPECTED: regex-auto 'Class-List<Int64>' is unsupported for this increment or decrement expression
    print("list0[0]: "+list0[0][0].toString())
    if (list0[0][0] == 1) {
        return 0
    }
    return 1
}
