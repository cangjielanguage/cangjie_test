// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(opt1: Option<Int32>, opt2: Option<Int32>): Int64 {
    var res1: Int32 = match (opt1) {
        case Some(x) => x
        case $None => 0
    }
    var res2: Int32 = match (opt2) {
        case Some(x) => x
        case $None => 0
    }
    if (res1 == 3 && res2 == 0){
        return 0
    }
    return 1
}

func main(): Int64 {
    var opt1: Option<Int32> = Some<Int32>(3)
    var opt2: Option<Int32> = None<Int32>
    return run(opt1, opt2)
}

