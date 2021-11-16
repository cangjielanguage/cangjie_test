// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class A{
  let a : Int32 = 5
  let b = Array<Int32>(5,this.a)
}

func main(): Int64{
    let a = A()
    return 0
}
