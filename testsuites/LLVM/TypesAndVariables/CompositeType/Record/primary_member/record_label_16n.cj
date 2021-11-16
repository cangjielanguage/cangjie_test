// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex initializer's type is incompatible with variable declaration 'a'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Test<T> {
    let a: T = 2
}

func run(): Int64 {
    var a: Int64 = 2
    let test = Test<Int64>(a)
    var res = test.a
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
