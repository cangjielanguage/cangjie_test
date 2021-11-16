// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan expected identifier here
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record Test<> {
    let a: Int64 = 1
}

func run(): Int64 {
    var a: Int64 = 4
    let test = Test<Int64>(a)
    var res = test.a
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
