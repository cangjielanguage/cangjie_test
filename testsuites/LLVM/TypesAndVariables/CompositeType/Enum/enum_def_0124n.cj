// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f

enum TimeUnit {
      Year(Int32, Int32) ; Month(Int32, Int32) ; Day(Int32, Int32) // EXPECTED: regex illegal enum member in enum block
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
