// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class LA{
  var a : Bool
  init(a:Bool){
    this.a = a
  }
}

func main(): Int64 {
    var l_a = LA(false)
    var r_a = 1
    var r_b = 1
    l_a.a = r_a == r_b
    if (l_a.a == true) {
        return 0
    }
    return 1
}
