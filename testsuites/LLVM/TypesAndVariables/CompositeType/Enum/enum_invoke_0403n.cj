// EXEC: %compiler %cmp_opt %n.cj 2>&1 | compare %f

enum TimeUnit { Year(Int32) }

func main(): Int64 {
    var time = TimeUnit.Year() // EXPECTED: regex no matching enum constructor 'Year' for given arguments
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
