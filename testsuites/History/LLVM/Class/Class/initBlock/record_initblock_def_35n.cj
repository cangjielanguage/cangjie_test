// EXEC: %compiler %cmp_opt  %n.cj -o %output 2>&1 | compare f%
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum Time{ Day }

func run(): Int64 {
    var time = Time.Day
    var res: Int32 = match (time) {
        case Day => init { var data: Int32 = 2}// EXPECTED: regex xxx
    }
    if ( res == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
