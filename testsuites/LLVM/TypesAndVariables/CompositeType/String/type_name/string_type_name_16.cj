// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

enum 星期 { Day(String) } // EXPECTED:regex illegal symbol


func run(): Int64 {
    var week = 星期.Day("Monday")
    var res: Int32 = match (week) {
        case Day(x) => 1
    }
    if (res == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
