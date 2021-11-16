// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data  {
    let a: Int32 = 1
    static let b: Int32 = a // EXPECTED: regex error.*?'a' is non-static member, cannot be accessed by static variable
}

func run(): Int64 {
    var data: Data = Data()
    if (data.a != 1 || Data.b != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
