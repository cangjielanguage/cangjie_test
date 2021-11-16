// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Range<Int32> = 5..0:-2
    var b : Range<Int32> = 6..0:-2
    if(a == b){
      return 2
    }
    return 0
}
