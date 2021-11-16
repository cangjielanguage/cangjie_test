// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

func run(): Int64 {
    var c1 = 'a'
    var c2 = 'a'
    if (c1 == c2){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}