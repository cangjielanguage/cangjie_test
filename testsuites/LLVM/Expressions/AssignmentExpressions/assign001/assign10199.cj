// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class LA{
  var a : Array<Int32>*Array<Int32>
  init(a:Int32){
    this.a = (@{a},@{a})
  }
}

func main(): Int64 {
    var l_a = LA(4)
    var r_a : Int32 = 2
    l_a.a[0][0] = r_a
    if (l_a.a[0][0] == Int32(2)) {
        return 0
    }
    return 1
}
