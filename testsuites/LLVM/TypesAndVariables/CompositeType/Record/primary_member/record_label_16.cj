// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test<T> {
    let a: T

    Test(x: T){
        a = x
    }
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
