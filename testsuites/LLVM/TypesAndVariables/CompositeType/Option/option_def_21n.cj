// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Time {
    Some(String)
}

var opt: Option<Int32> = Some<Int32>(20)

func run(): Int64 {
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

