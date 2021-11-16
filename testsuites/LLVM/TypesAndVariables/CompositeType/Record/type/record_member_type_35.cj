// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    func f(x: Char): Char { return x}
}

let res = Test()
let res1 = res.f('a')

func run(): Int64 {
    if (res1 == 'a') {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
