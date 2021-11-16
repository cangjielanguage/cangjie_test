// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call

func test(a : Int64): Int64 {
    return a
}

func callFunc(myfunc : (Int8) -> Int64): Int64 {
    var a : Int8 = 0
    return myfunc(a)
}

func main(): Int64 {
    return callFunc(test)
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
