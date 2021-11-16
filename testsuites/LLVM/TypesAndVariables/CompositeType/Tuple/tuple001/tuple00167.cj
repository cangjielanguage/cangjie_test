// EXEC:%compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class A{
  var a : Int32 = 1
}

class B <: A{
  var b : Int32
  init(){
    this.b = 1
  }
  var MyTuple = (this,this) // EXPECTED: regex 'this' is not allowed to initialize non-static member
}


func main(): Int64 {
    var a = B()
    return 0
}
