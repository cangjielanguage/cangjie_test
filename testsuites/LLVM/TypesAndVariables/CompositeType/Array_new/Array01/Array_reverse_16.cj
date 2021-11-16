// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let b = Array<Array<Int8>>([Array<Int8>([1, 2, 3]),Array<Int8>([4, 5, 6])])
    b.reverse()
    b[0].reverse()

    if(b[0][0] != 6 || b[0][1] != 5 || b[0][2] != 4 || b[1][0] != 1 || b[1][1] != 2 || b[1][2] != 3){
      return 2
    }
    return 0
}
