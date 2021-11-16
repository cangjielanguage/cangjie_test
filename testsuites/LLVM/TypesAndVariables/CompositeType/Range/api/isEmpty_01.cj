// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
  var b: Range<Int64> = Range<Int64>(0, 10, 5, true, true, false)
  if(b.isEmpty()){
    return 2
  }
  return 0
}
