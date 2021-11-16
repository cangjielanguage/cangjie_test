// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let b = Array<Int64>([1, 2, 3])
    b.reverse()

    if(b[0] == 3 && b[1]== 2 && b[2] == 1){
      return 0
    }
    return 2
}
