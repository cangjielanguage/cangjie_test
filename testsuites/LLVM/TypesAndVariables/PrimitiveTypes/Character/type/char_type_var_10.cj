// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

record Foo {
    var c: Char = 'd'
}

func run(): Int64 {
    var res: Char = Foo().c
    if (res == 'd'){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
