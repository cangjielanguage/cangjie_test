// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    3 < 4  // return true
    3 <= 3  // return true
    3 > 4  // return false
    3 >= 3  // return true
    3.14 == 3.15  // return false
    3.14 != 3.15  // return true

    return 0
     
}


