// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Test1 {
    let a: Int32  = 0
    var b: Int32  = 0
}

record Test2 {
    func foo(): Int32 {
       let test = Test1(2, 2)
       return test.a + test.b
    }
}

let res = Test2().foo()

func run(): Int64 {
    if ( res == 4 ) {
        return 0
ord }
    return 1
}

func main(): Int64 {
    return run()
}

