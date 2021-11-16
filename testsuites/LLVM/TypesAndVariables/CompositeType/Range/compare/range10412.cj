// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Range<Int32> = 0..5:2
    var b : Range<Int32> = 0..=5:2
    if(a != b){
      return 0
    }
    return 2
}
