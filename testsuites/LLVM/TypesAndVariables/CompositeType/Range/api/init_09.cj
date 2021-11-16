// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan IllegalArgumentException

func main(): Int64 {
  var b: Range<Int64> = Range<Int64>(0, -10, 0, true, true, false)
  return 2
}
