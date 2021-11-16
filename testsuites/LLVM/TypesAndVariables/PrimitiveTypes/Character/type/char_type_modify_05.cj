// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

class A {
    private var c: Char = 'a'

    func getCharacter() { return c }
}

func run(): Int64 {
    var res = A().getCharacter()
    if (res == 'a'){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}