// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var time2 = Day
var time1 = TimeUnit.Day
var time3 = Day
var res1: Int32 = match (time1) {
    case $Year => 0
    case $Month => 1
    case $Day => 2
    case $Hour => 3
}

var res2: Int32 = match (time2) {
    case $Year => 1
    case $Month => 2
    case $Day => 3
    case $Hour => 4
}

enum TimeUnit {
    Year | Month | Day | Hour
}

func run(): Int64 {
    if (res1 == 2 && res2 == 3) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
