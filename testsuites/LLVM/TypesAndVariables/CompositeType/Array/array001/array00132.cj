// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func func0():Unit{
  return
}

func func1():Unit{
  return
}

func func2(input:Int32):Int32{
  return input
}

func main(): Int64 {
    let myArray0 : Array<(() -> Unit)> = @{func1}
    let myArray1 : Array<(()->Unit)> = @{{ =>()}}
    let myArray2 : Array<((Int32) -> Int32)> = @{func2,func2}
    return 0
}
