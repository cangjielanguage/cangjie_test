// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record LA{
  LA(var a : Int32) {}
}
interface RA{
  let a : Int32 = 2
}
func main(): Int64 {
    var l_a = LA(4)
    
    l_a.a = RA.a
    if l_a.a == Int32(2) {
        return 0
    }
    return 1
}
