// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    var a: Int32 = 1
    var b: Int32 = 2
}

func run(test: Test): Int64 {
    let res1 = test.a
    let res2 = test.b
    if (res1 == 1 && res2 ==2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    let test = Test()
    return run(test)
}
