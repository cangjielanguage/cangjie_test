// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
func main(): Int64 {
    let a = 1
    func f1():Int64{
        func f2(): Int64 {
            {a} // ASSERT: regex cannot capture mutable variable 'a'
            return 0
        }
        let a = 2
        return 0
    }
    f1()

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace