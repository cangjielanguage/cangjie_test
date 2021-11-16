// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex missing argument for call with parameter list
func test(a : Int64): Int64 {
    return a
}

func callFunc(myfunc : (Int64, Int64) -> Int64): Int64 {
    return myfunc(0)
}

func main(): Int64 {
    return callFunc(test)
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
