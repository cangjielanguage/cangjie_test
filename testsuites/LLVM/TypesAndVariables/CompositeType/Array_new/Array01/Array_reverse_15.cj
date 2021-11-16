// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let b = Array<Bool>([false, false, true])
    b.reverse()

    if(b[0] && !b[1] && !b[2]){
      return 0
    }
    return 1
}
