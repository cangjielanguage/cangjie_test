// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a  = 5..0:-7
    var b  = 5..=0:-8
    if(a != b){
      return 0
    }
    return 2
}
