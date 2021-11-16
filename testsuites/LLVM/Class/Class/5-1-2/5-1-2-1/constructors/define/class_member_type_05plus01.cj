// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    func f(x: Unit): Unit {}
}

var tmp: Unit = ()
let res = Test()
let res1 = res.f(tmp)

func run(): Int64 {
    if (res1 == ()) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
