// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface MyInterface{
  let i : Int64 = 0
}

func main():Int64 {
  MyInterface.i
  return MyInterface.i
}
