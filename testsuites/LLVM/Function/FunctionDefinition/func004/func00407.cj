// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call

func test(a : Int32): Int32 {
    return a
}

func callFunc(myfunc : Int32): Int32 {
    return myfunc(0)
}

func main(): Int64 {
    return callFunc(test)
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
