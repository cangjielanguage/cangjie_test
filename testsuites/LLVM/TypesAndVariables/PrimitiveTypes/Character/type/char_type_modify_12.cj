// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

var c: Char = 'a'

func run(): Int64 {
    if (c == 'a'){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}