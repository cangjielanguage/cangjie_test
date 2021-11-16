// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f


func main(): Int64 {
    var l_a : Unit = ()

    l_a = { return 0 }  // EXPECTED: regex type incompatible in this assignment
    if (l_a == ()) {
        return 0
    }
    return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
