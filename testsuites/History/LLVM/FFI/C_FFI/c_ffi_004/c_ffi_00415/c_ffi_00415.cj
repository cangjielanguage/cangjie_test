// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args
foreign func ArrayFunc(arr:Array<Bool>): Bool

@c
record UnsafePtr {
    private var address : Int64 = 0
}

foreign func ReturnArray():UnsafePtr

foreign func unsafePointerCast1(arr:UnsafePtr,size:Int64):Array<Bool>

func arrayPass():Int64{
  var ptr = unsafe { ReturnArray() }
  var retArray = unsafe { unsafePointerCast1(ptr,1)}
  if (retArray[0] != false) {
    return 1
  }
  var res = unsafe { ArrayFunc(retArray) }
  if (res != true) {
    return 2
  }
  return 0
}

func main():Int64 {
  return arrayPass()
}
