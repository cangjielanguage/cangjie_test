// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

record Foo {
    var c: Char
    init(c1: Char) {
        c = c1
    }
}

func run(): Int64 {
    var foo = Foo('e')
    var res: Char = foo.c
    if (res == 'e'){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}