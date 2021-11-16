// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {

    let x: Int64 = 10
        x
    }else&if x > 5{
        var y = x
    }else {
        var y = 5
    }


    return 0
}

