// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

record Foo {
    func bar(c: Char) {
        return c
    }
}

func run(): Int64 {
    var c = 'g'
    var res: Char = Foo().bar(c)
    if (res == 'g'){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}