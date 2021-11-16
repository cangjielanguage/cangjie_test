// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func myFunc():Unit{
  return
}

func main(): Int64 {
    let myArray : Array<Unit> = @{myFunc(),()}
    return 0
}
