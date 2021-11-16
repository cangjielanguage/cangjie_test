// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class LA{
  var a : Array<Unit>
  init(a:Unit){
    this.a = @{a}
  }
}

func main(): Int64 {
    var l_a = LA(())
    
    l_a.a[0] = if (true) {}
    if (l_a.a[0] == ()) {
        return 0
    }
    return 1
}
