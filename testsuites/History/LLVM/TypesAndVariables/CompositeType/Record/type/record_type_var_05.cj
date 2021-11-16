// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    Test(let a!: Int32 = 1, let b!: Int32 = 2) {}
}

interface I {
    let test: Test = Test(a:3, b:4)
}

func run(): Int64 {
    var test = I.test
    let res1 = test.a
    let res2 = test.b
    if (res1 == 3 && res2 == 4 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    let test = Test()
    return run()
}
