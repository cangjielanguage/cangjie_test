// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Range<Int64> = 0..5:7
    var b : Range<Int64> = 0..=5:8
    if(a == b){
      return 2
    }
    return 0
}
