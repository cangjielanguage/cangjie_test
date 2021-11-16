// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f

func main(): Int64 {

    let x: Int64 = 10
    if x > 10 {    // ASSERT: regex the type of this 'if' expression is 'Any', please explicitly annotate the type or fix the code
        var y = x + 1
    }else{
        x
    }


    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace