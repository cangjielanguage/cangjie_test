// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record LA{
  var a : Array<Bool>
  init(input:Bool){
    a = @{input}
  }
}

func main(): Int64 {
    var l_a = LA(false)
    var r_a = 2
    var r_b = 1
    l_a.a[0] = r_a > r_b
    if (l_a.a[0] == true) {
        return 0
    }
    return 1
}
