// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
  var a: Range<Int64> = 0..10:-5
  var b = 0
  for(i in a.iterator()){
    return 2222
    b ++
  }
  return b
}
