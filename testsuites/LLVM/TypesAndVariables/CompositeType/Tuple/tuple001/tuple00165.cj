// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class A{
  var a : Int32 = 1
  var MyTuple : Int32*Int32 = (this.a,this.a)
}


func main(): Int64 {
    var a = A()
    return 0
}
