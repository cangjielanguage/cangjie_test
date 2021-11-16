// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f

func main(): Int64 {
    var a = 1

    func f1():Int64{
        {a} // ASSERT: regex cannot capture mutable variable 'a'
        return 0
    }

    f1()

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace