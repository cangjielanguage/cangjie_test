// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    let res = 6.4.toString()
    if (res.toString() == "6.400000"){
        return 0

    }
    print(6.4.toString())
    return 1
}

func main(): Int64 {
    return run()
}
