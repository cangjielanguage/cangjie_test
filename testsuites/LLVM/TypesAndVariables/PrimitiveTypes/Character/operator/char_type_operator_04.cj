// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

func run(): Int64 {
    var c1 = 'a'
    var c2 = 'b'
    if (c2 > c1){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}