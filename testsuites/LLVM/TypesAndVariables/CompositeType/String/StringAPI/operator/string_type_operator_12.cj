// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

func run(): Int64 {
    var a = "a"
    var b = "b"
    let c = if (a <= b) { a } else { b }
    if ( c == "a"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
