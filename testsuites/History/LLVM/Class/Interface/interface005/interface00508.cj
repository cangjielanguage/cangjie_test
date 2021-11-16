// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
let i : Int32 = 0

interface MyInterface{
  let i : Int32 = 0
}

func main():Int64 {
  let i : Int32 = 0
  return 0
}
