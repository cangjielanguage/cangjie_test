// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args
foreign func ArrayFunc(arr:Array<Int32>): Array<Int32>

@c
record UnsafePtr {
    private var address : Int64 = 0
}

foreign func ReturnArray():UnsafePtr

foreign func unsafePointerCast1(arr:UnsafePtr, length:Int64):Array<Int32>
foreign func unsafePointerCast2(arr:UnsafePtr, length:Int64):Array<Int32>

func arrayPass():Int64{
  var ptr = unsafe { ReturnArray() }
  var retArray = unsafe { unsafePointerCast1(ptr,5) }
  if (retArray[4] != 5) {
    return 1
  }
  var retArray2 = unsafe { unsafePointerCast2(ptr,5) }
  if (retArray2[4] != 5) {
    return 1
  }
  return 0
}

func main():Int64 {
  return arrayPass()
}
