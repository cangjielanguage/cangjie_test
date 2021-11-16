// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto 'a' is non-static member, cannot access by type name
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


record Test {
    let a: Int32 = 2
}

let res = Test.a

func run(): Int64 {

    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


