// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit {
    Month | Day
}

trait Num {
    func plus(a: This, b: This): This
}

append TimeUnit with Num {
    func plus(a: TimeUnit, b: TimeUnit): TimeUnit { b }
}

func run(): Int64 {
    var a = TimeUnit.Month
    var b = TimeUnit.Day

    let x = plus(a , b)

    var res: Int32 = match (x) {
        case $Month => 1
        case $Day => 2
    }

    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
