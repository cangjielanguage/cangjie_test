// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func foo<T>(x: T): T{
    return x
}

record Test {
    var a: (Int32) -> Int32 = foo<Int32>
}

func run(): Int64 {
    var i: Int32 = 2
    let res: Int32 = Test().a(i)
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
