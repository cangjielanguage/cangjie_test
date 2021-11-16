// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 1050

func main(): Int64 {
  var a: Range<Int64> = 10..=0:-5
  for(i in a.iterator()){
    print(i.toString())
  }
  return 0
}
