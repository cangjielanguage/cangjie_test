// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class A{
  let a : Int64 = 5
  let myArray = Array<Int32>(this.a,0)
}



func main(): Int64{
    let a = A()
    return 0
}
