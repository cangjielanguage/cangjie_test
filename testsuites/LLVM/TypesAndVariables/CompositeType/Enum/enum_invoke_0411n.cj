// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

enum TimeUnit {
      Day
      | Hour
      | YearMonth
}

func run(): Int64 {
    var time = TimeUnit.YearMonth() // EXPECTED: regex-auto no matching function for operator '()' function call
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
