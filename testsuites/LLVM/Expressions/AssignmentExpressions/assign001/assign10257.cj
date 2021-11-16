// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record LA{
  var a : Array<Int32>
  init(input:Int32){
    a = @{input}
  }
}

func main(): Int64 {
    var l_a = LA(4)
    
    l_a.a[0] = 2
    if (l_a.a[0] == Int32(2)) {
        return 0
    }
    return 1
}
