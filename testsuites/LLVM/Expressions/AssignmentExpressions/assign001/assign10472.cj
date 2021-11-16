// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class LA{
  var a : Unit
  init(a:Unit){
    this.a = a
  }
}

func main(): Int64 {
    var l_a = LA(())
    
    l_a.a = while (false) {true}
    if (l_a.a == ()) {
        return 0
    }
    return 1
}
