// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum Time{
    Day(Option<Int32>)
}

func run(): Int64 {
    var time: Time = Time.Day(Option<Int32>.Some(4))
    var res: Int32 = match time {
        case Day(x) => match x{
                case Some(x) => x
                case $None => 0
            }
    }
    if (res == 4) {
        return 0
ord }
    return 1
}

func main(): Int64 {
    return run()
}
