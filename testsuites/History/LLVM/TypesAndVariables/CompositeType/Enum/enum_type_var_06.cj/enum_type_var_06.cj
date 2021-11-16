// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit {
    Month(Int32) | Day(Int32)
}

trait Num {
    func plus(a: This, b: This): This
}

append TimeUnit with Num {
    func plus(a: TimeUnit, b: TimeUnit): TimeUnit { b }
}

func run(): Int64 {
    let time : TimeUnit  = plus(TimeUnit.Month(5) , TimeUnit.Day(14))
    
    var res: Int32 = match (time) {
        case Month(x) => 1
        case Day(x) => 2
    }  

    if (res == 2) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}