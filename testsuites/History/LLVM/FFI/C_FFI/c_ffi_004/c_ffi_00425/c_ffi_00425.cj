// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args
foreign func ArrayFunc(arr:Array<Float32>): Float32

@c
record UnsafePtr {
    private var address : Int64 = 0
}

foreign func ReturnArray():UnsafePtr

foreign func unsafePointerCast1(arr:UnsafePtr,size:UInt64):Array<Float32>

func arrayPass():Int64{
  var ptr = unsafe { ReturnArray() }
  var retArray = unsafe { unsafePointerCast1(ptr,1) }
  if (retArray[0] != 0.1) {
    return 1
  }
  var res = unsafe { ArrayFunc(retArray) }
  if (res != 0.2) {
    return 2
  }
  return 0
}

func main():Int64 {
  return arrayPass()
}
