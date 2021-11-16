// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

open class A {
    protected var c: Char = 'a'
}

class SubB <: A {
    var newChar : Char
    init() {
        newChar = c
    }
}

func run(): Int64 {
    var res = SubB().newChar
    if (res == 'a'){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}