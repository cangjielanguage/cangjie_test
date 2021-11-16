// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class A{
  let b : Int64 = 1
  let a : Array<Int64> = @{1,0}
  let c = a[this.b]
}

func main(): Int64 {
    var c = A()
    return c.c
}
