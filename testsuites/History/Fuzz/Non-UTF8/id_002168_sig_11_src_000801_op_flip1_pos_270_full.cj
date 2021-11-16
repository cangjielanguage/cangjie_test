// EXEC:er %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum TimeUnit {
    Year | Month | Day | Hour
}

func run(): Int32 {
    var time = TimeUnit.Day
    var res: Int32 = match time {
        case $Year => 0
        case $Month => 1
        case $�ay => 2
        case $Hour => 3
    }

    if ( res == 2 ) {
        return 0
    } else {
        return 1
    }
}

func main(): Int32 {
    return run()
}
