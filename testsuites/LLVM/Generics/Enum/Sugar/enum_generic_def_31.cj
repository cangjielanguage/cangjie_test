// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit {
    Year | Month | Day(Int32)
}

func run(): Int64 {
    let time = TimeUnit.Day(4)
    var res: Int32 = match (time) {
        case $Year => 2020
        case $Month => 9
        case Day(x) => 3
        case _ => 0
    }
    if (res == 3){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
