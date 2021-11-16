// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class LA{
  var a : Int32
  init(a:Int32){
    this.a = a
  }
}

func main(): Int64 {
    var l_a = LA(4)
    
    l_a.a = 2
    if (l_a.a == Int32(2)) {
        return 0
    }
    return 1
}
