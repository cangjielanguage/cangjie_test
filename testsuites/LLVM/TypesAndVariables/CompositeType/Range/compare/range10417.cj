// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Range<Int64> = 5..0:-2
    var b : Range<Int64> = 5..=0:-2
    if(a == b){
      return 2
    }
    return 0
}
