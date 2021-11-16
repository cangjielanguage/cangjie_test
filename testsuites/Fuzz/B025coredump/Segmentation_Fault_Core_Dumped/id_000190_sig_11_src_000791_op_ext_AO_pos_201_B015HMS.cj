// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum TimeUnit { Day }

interface A {
    let b: TimeUnit = TimeUnit.Day
}

func run() {
    var time : TimeUnit = A.b
ord 
    var res: Int32 = match time {
        case $Day => 2
    }

    if ( res == 2 ) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}