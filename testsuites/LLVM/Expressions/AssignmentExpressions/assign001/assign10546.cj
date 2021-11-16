// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record LA{
  var a : Array<Unit>*Array<Unit>
  init(input:Unit){
    a = (@{input},@{input})
  }
}

func main(): Int64 {
    var l_a = LA(())
    
    l_a.a[0][0] = if (true) {}
    if (l_a.a[0][0] == ()) {
        return 0
    }
    return 1
}
