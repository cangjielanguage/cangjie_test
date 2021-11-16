// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
foreign func ArrayFunc(arr:Array<Int32>): Int32

func arrayPass():Int64{
  var a : Array<Int32> = @{0[
  return Int64(ArrayFunc(a))
}

func main():Int64 {
  return arrayPass()
}
