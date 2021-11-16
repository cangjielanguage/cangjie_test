// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface RA{
  let a : Int32 = 2
}
func main(): Int64 {
    var l_a : Array<Int32>*Array<Int32> = (@{4},@{4})
    
    l_a[0][0] = RA.a
    if l_a[0][0] == Int32(2) {
        return 0
    }
    return 1
}
