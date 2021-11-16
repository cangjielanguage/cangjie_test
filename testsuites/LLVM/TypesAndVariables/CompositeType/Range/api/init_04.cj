// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
  var b: Range<Int64> = Range<Int64>(0, Int8(10), 5, true, true, true) //EXPECTED: regex no matching constructor for call 'Range'
  return 2
}
