// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let b = Array<Char>(['a', 'b', 'c'])
    b.reverse()

    if(b[0] == 'c' && b[1]== 'b' && b[2] == 'a'){
      return 0
    }
    return 1
}
