// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record LA{
  var a : Array<Int32>*Array<Int32>
  init(input:Int32){
    a = (@{input},@{input})
  }
}

func main(): Int64 {
    var l_a = LA(4)
    func r_a():Int32{return 2}
    l_a.a[0][0] = r_a()
    if (l_a.a[0][0] == Int32(2)) {
        return 0
    }
    return 1
}
