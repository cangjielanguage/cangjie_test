// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record RA{
  var a : Int32
  init(input:Int32){
    a = input
  }
}
func main(): Int64 {
    var l_a : Int32 = 4
    var r_a = RA(2)
    l_a = r_a.a
    if (l_a == Int32(2)) {
        return 0
    }
    return 1
}
