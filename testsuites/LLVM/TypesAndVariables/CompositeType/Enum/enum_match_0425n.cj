// EXEC: %compiler %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT: regex-auto undeclared identifier 'Day'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


enum TimeUnit {
    Year(Int32) | Month(Int32)
}

func main(): Int64 {
    var time = TimeUnit.Year(2020)
    var res: Int32 = match (time) {
        case Year(x) => 2020
        case Month(x) => 5
        case Day(x) => 8
    }

    if (res == 2020) {
        return 0
    } else {
        return 1
    }
}
