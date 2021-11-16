// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
  var b: Range<Float16> = Range<Float16>(Float16(0), Float16(10), 5, true, true, true) //EXPECTED: regex generics type arguments do not match the constraint
  return 2
}
