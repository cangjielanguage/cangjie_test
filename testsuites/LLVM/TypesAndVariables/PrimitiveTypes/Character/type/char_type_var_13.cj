// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

record Foo {
    func bar() {
        var c = 'v'
        return c
    }
}

func run(): Int64 {
    var res = Foo().bar()
    if (res == 'v'){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}