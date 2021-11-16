// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func run(): Int64 {
    var opt: Option<Int32> = Option<Int32>.Some(4)
    var opt2: Option<Option<Int32>> = Option<Option<Int32>>.Some(opt)
    var res: Int32 = match (opt2) {
        case Some(x) => match (x) {
                case Some(x) => x
                case $None => 0
            }
        case $None => 0
    }
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
