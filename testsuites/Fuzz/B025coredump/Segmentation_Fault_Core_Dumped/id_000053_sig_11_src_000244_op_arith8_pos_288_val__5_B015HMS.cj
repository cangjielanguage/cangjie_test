// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
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
    let myArray1 : Array<(()->Unit)> = @{#)=>{()}}
    let myArray2 : Array<((Int32) -> Int32)> = @{func2,func2}
    return 0
}
