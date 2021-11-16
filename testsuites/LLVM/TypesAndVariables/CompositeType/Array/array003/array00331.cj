// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class A{
  let a : Int64 = 5
}

class B <: A{
  let myArray = Array<Int32>(super.a,0) // EXPECTED: regex 'super' is not allowed to initialize non-static member
}



func main(): Int64{
    let a = B()
    return 0
}
