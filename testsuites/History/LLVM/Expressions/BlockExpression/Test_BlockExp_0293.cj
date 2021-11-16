// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f

func main(): Int64 {

    let x: Int64 = 10
    let y: Int32 = 11
    if x > 10 {       // ASSERT: regex the type of this 'if' expression is 'Any', please explicitly annotate the type or fix the code
        x
    }else if x > 5{    // ASSERT: regex the type of this 'if' expression is 'Any', please explicitly annotate the type or fix the code
        y
    }else {
        x
    }


    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace