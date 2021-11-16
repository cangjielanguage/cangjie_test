// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let b = Array<Float16>([1.0, 2.0, 3.0])
    b.reverse()

    if(b[0] == 3.0 && b[1]== 2.0 && b[2] == 1.0){
      return 0
    }
    return 2
}
