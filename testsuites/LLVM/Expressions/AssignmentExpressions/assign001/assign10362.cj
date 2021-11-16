// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class LA{
  var a : Array<Bool>
  init(a:Bool){
    this.a = @{a}
  }
}

func main(): Int64 {
    var l_a = LA(false)
    var r_a = true
    var r_b = true
    l_a.a[0] = r_a && r_b
    if (l_a.a[0] == true) {
        return 0
    }
    return 1
}
