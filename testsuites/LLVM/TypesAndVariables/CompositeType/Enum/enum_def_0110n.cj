// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto 'Year' is already exist in enum 'TimeUnit'

enum TimeUnit {
      Year(Int32, Int64) | Year(Int32, Int32)
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
