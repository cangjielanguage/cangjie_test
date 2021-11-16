// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

interface I {
    static func bar(c: Char) { return c }
}

class Test <: I{}

func run(): Int64 {
    var c = 'b'
    var res: Char = Test.bar(c)
    if (res == 'b'){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}