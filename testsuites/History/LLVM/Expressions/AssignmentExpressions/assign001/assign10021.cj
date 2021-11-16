// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface RA{
  let a : Int32 = 2
}
func main(): Int64 {
    var l_a : Int32 = 4
    
    l_a = RA.a
    if l_a == Int32(2) {
        return 0
    }
    return 1
}
