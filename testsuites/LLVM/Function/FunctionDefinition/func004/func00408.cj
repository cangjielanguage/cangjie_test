// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected type begin with \'\:\' in function parameter

func test(a : Int64): Int64 {
    return a
}

func callFunc(myfunc): Int64 {
    return myfunc(0)
}

func main(): Int64 {
    return callFunc(test)
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
