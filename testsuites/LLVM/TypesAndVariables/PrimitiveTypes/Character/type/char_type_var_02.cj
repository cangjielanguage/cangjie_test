// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

func foo(): Char {
    var c = 'a'
    return c
}

func run(): Int64 {
    var res = foo()
    if (res == 'a'){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}