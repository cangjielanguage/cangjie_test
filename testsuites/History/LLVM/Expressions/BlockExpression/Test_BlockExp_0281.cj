// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f

func main(): Int64 {

    func a(x: Int64, y:Int64): Int64
    {
        let c = x + y    // ASSERT: regex type of return expression is incompatible with return type
    }


    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace