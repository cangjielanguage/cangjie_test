// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Time{
    Day(Option<Int32>)
}

func run(): Int64 {
    var time: Time = Time.Day(Option<Int32>.Some(4))
    var res: Int32 = match (time) {
        case Day(x) => match (x) {
                case Some(x) => x
                case $None => 0
            }
    }
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
