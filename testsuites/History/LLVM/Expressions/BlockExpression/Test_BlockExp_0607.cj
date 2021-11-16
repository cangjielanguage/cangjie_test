// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f

func main(): Int64 {
    let a = 1

    func f1():Int64{

        a = {a} // ASSERT: regex cannot assign to value : 'a' is an initialized 'let' constant

        return 0
    }
    f1()

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace