// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var opt = Some<Int32>(20)
    var res: Int32 = match (opt) {
        case Some(x) => x
        case $None => 0
    }
    if (res == 20){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

