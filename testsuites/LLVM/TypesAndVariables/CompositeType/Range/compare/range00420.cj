// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func foo(): Int64{
  return 5
}

func main(): Int64 {
    var a  = foo()..0:-7
    var b  = foo()..=0:-8
    if(a != b){
      return 0
    }
    return 2
}
