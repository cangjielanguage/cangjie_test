// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit { Day(Int32) }

interface A {
    let b: TimeUnit = TimeUnit.Day(14)
}

func run() {
    var time : TimeUnit = A.b
    
    var res: Int32 = match time {
        case Day(x) => x + 2
    }

    if ( res == 16 ) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}