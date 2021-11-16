// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var l_a : Int32*Int32 = (4,4)
    l_a[0]++ // EXPECTED: regex 'tuple access' is unsupported for this increment or decrement expression
    if (l_a[0] != Int32(5)) {
        return 1
    }
    l_a[0]-- // EXPECTED: regex 'tuple access' is unsupported for this increment or decrement expression
    if (l_a[0] != Int32(4)) {
        return 2
    }
    return 0
}
