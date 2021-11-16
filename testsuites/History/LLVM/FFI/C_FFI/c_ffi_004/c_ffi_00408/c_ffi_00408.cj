// DEPENDENCE: %n.c
// EXEC: %compiler %cmp_opt %f -o %n 2>&1 | compare %f
// ASSERT: regex redefinition of declaration 'unsafePointerCast1'
foreign func ArrayFunc(arr:Array<Int32>): Array<Int32>

class UnsafePtr{}

foreign func ReturnArray():UnsafePtr

foreign func unsafePointerCast1(arr:UnsafePtr, length:Int64):Array<Int32>
foreign func unsafePointerCast1(arr:UnsafePtr, length:Int64):Array<Int32>

func arrayPass():Int32{
  var ptr = ReturnArray()
  var retArray = unsafePointerCast1(ptr,5)
  if (retArray[4] != 5) {
    return 1
  }
  var retArray2 = unsafePointerCast1(ptr,5)
  if (retArray2[4] != 5) {
    return 1
  }
  return 1
}

func main():Int64 {
  return arrayPass()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
