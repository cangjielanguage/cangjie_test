// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a  = 0..5:2
    var b  = 0..=5:2
    if(a == b){
      return 2
    }
    return 0
}
