// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class A{
  var a : Int32 = 1
}

class B <: A{
  var MyTuple : Int32*Int32 = (super.a,super.a) // EXPECTED: regex 'super' is not allowed to initialize non-static member
}


func main(): Int64 {
    var a = B()
    return 0
}
