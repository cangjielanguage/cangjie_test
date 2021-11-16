// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class LA{
  var a : Array<Unit>*Array<Unit>
  init(a:Unit){
    this.a = (@{a},@{a})
  }
}

func main(): Int64 {
    var l_a = LA(())
    var r_a : Int32 = 1
    l_a.a[0][0] = r_a++
    if (l_a.a[0][0] == ()) {
        return 0
    }
    return 1
}
