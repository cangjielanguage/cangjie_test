// DEPENDENCE: %n.c
// EXEC: %compiler %cmp_opt %f -o %n 2>&1 | compare %f
// ASSERT: regex function declaration must have function body
foreign func ArrayFunc(arr:Array<Int32>): Array<Int32>

class UnsafePtr{}

foreign func ReturnArray():UnsafePtr

func unsafePointerCast(arr:UnsafePtr, length:Int64):Array<Int32>

func arrayPass():Int32{
  var ptr = ReturnArray()
  var retArray = unsafePointerCast(ptr,5)
  if (retArray[4] == 5) {
    return 0
  }
  return 1
}

func main():Int64 {
  return arrayPass()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
