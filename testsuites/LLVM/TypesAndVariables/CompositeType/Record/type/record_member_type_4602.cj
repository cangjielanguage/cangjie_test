// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func foo<T>(x: T): T{
    return x
}

record Test {
    func f(x: (Int32) -> Int32): (Int32) -> Int32 { return x}
}

var i : Int32 = 2
let t = Test()
let res = t.f(foo<Int32>)

func run(): Int64 {
    if (res(2) == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
