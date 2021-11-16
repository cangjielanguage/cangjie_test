// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func c(): Int64{
  return 5
}

func main(): Int64 {
    var a : Range<Int64> = c()..0:-7
    var b : Range<Int64> = c()..=0:-8
    if(a != b){
      return 0
    }
    return 2
}
