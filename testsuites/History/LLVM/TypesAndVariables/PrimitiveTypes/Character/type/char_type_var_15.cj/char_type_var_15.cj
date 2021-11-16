// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait CharTrait {
    func test(a: This, b: This): Char
}

append Char with CharTrait {
    func test(a: Char, b: Char): Char {
        if (a>b) {
            return a
        }else {
            return b
        }
    }
}

func run(): Int64 {
    var c1 = '1'
    var c2 = '2'
    var c3 = '4'
    var res1 = test(c1, c2)
    var res2 = test(c3, c1)
    if (res1 == '2' && res2 == '4') {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}