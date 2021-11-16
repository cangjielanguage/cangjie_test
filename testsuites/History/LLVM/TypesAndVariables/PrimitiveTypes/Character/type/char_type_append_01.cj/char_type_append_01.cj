// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait CharTrait {
    func compare(a: This, b: This): String
}

append Char with CharTrait {
    func compare(a: Char, b: Char): String {
        if (a>b){
            return a.toString() + ";"
        } else {
            return b.toString() + "!"
        }
    }
}

var c1 = 'a'
var c2 = 'a'
var c3 = 'b'

func run(): Int64 {
    var res1 = compare(c1, c2)
    var res2 = compare(c3, c2)
    if (res1 == "a!" && res2 == "b;") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}