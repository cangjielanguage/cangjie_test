// EXEC: %compiler %cmp_opt  %n.cj -o %output 2>&1 | compare %f

enum TimeUnit {
      Hour(Int32)
}

func run(): Int64 {
    var time = TimeUnit.Hour(2020)
    var res: Int32 = match (time) {
        case TimeUnit.Hour(x) => x  // EXPECTED: regex expected '=>' after pattern in case body
    }

    if (res == 2020) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
