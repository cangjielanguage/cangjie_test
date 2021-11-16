// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit { Year }

func run(): Int64 {
    var time = TimeUnit.Year
    var res: Int32 = match (time) {
        case $Year => 2020
    }

    if (res == 2020) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
