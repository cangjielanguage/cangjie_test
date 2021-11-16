// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let b = Array<Int16>([1, 2, 3, 4])
    b.reverse()

    if(b[0] != 4 || b[1] != 3 || b[2] != 2 || b[3] != 1){
      return 2
    }
    return 0
}
