// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex error: memory allocation failed
foreign func ArrayFunc(arr:Array<Int32>): Array<Int32>

class UnsafePtr{}

foreign func ReturnArray():UnsafePtr

foreign func unsafePointerCast1(arr:UnsafePtr,size:Float64):Array<Int32>

func arrayPass():Int32{
  var ptr = ReturnArray()
  var retArray = unsafePointerCast1(ptr,5)
  if (retArray[4] != 5) {
    return 1
  }
  var retArray2 = unsafePointerCast1(ptr,5)
  if (retArray2[4] != 5) {
    return 2
  }
  return 0
}

func main():Int64 {
  return arrayPass()
}
