// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum TimeUnit1 {
      Hour
      | Day(Int32)
}
enum TimeUnit2 {
       Month(TimeUnit1)
}

func run(): Int64 {
    var time = TimeUnit2.Month(TimeUnit1.Day(5))
    var res: Int32 = match (time) {
        case Int64($Hour) => 0     // EXPECTED: regex expected pattern here
        case Month($Day(x)) => x
    }
    if ( res == 5 ) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
