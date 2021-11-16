// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Test {
    var a: Int32 = 1
    var b: Int32 = 2
    Test(a1!: Int32 = 1,b1!: Int32 = 2) {
         a = a1
         b = b1
         return
    }
}

let res = Test(a1:2)
let res1 = res.a
let res2 = res.b

func run(): Int64 {
    if (res1 == 2 && res2 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

