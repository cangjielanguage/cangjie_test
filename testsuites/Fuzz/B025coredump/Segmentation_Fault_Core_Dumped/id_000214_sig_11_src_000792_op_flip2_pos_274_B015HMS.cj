// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum TimeUnit { Day(Int32) }

interface A {
    let b: TimeUnit = TimeUnit.Day(14)
}

func run() {
    var time : TimeUnit = A.b
    
    var res: Int32 = match time {
        case Day(x) => x +#2
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