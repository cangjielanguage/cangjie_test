// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto expected enum value

enum TimeUnit {
      Year(Int32, Int32) |
}