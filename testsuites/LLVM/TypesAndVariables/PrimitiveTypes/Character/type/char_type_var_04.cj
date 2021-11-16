// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

class Foo {
    var c: Char
    init(c: Char) {
        this.c = c
    }
}

func run(): Int64 {
    var foo = Foo('a')
    var res: Char = foo.c
    if (res == 'a'){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}