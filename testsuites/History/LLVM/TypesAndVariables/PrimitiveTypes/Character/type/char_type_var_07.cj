// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

interface I {
    let c: Char = 'b'
}

func run(): Int64 {
    var res: Char = I.c
    if ( res == 'b' ){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}