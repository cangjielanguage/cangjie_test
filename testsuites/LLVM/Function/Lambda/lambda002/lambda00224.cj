// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class C1{
  let aa = 1
}

class C2 <: C1{
  let a = 2
  let lambdaExpression = { a : Int64 => a}
}

func test(): Int64 {
    return 0
}

func main(): Int64 {
    return test()
}
