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

foreign func unsafePointerCast(arr:UnsafePtr, length:Int64):Array<Int32>

func arrayPass():Int64{
  var ptr = unsafe { ReturnArray() }
  var retArray = unsafe { unsafePointerCast(ptr,5) }
  if (retArray[4] == 5) {
    return 0
  }
  return 1
}

func main():Int64 {
  return arrayPass()
}
