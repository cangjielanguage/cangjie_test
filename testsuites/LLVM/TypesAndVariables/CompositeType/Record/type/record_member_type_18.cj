// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    let a: Char
    init(x: Char) {
        a = x
    }
}

let res = Test('b')
let res1 = res.a

func run(): Int64 {
    if (res1 == 'b') {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
