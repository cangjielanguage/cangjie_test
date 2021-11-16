// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record LA{
  var a : Array<Int64>
  init(input:Int64){
    a = @{input}
  }
}

func main(): Int64 {
    var l_a = LA(4)
    var r_a : Int64 = 2
    l_a.a[0] = r_a
    if (l_a.a[0] == Int64(2)) {
        return 0
    }
    return 1
}
