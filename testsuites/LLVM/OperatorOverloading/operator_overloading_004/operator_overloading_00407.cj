// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    operator func + (inputB:A):Bool{ // EXPECTED: regex 'operator' is keyword not identifier
        return true
    }
}

func main():Int64{
    let a = A()
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
