// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

class A {
    public var c: Char = 'a'
}

class B {
    var character: Char = A().c
}

func run(): Int64 {
    var res = B().character
    if (res == 'a'){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}