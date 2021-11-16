// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    let res1 = true.toString()
    let res2 = false.toString()
    if (res1=="true" && res2=="false"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}