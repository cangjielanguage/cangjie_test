// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func foo(): Int64 {
    var res1 = if(true) {"hi"} else {'b'}    // EXPECTED: regex Types Record-String and Char of the two branches of this 'if' expression mismatch.
    var res2 = if(false) {'a'} else {3}    // EXPECTED: regex Types Char and Int64 of the two branches of this 'if' expression mismatch.
    return 0
}

func main(): Int64 {
    return foo()
}
