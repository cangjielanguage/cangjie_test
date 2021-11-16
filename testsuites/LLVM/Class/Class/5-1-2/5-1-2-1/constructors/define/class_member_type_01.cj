// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    let a: Char = 'a'
    var b: Char
    init(x: Char){
        b = x
    }
    func f(x: Char): Char{
        return x
    }
}

func run(): Int64 {
    var test: Test = Test('b')
    var res1: Char = test.a
    var res2: Char = test.b
    var res3: Char = test.f('c')
    if (res1 == 'a' && res2 == 'b' && res3 == 'c') {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
