// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -lcangjie-basert -lsecurec -o lib%n.o
// EXEC-PIPE-1: %compiler %cmp_opt %f lib%n.o -o %output 2>&1 | compare %f
// ASSERT: regex native function can only have CType args
// ASSERT: regex native function can only have CType return
foreign func ArrayFunc(arr:Array<Int32>): Array<Int32>

@c
record UnsafePtr {
    private var address : Int64 = 0
}

foreign func ReturnArray():UnsafePtr

foreign func UnsafePointerCast(arr:UnsafePtr, length:Int64):Array<Int32>

func arrayPass():Int64{
  var ptr = unsafe { ReturnArray() }
  var retArray = unsafe { UnsafePointerCast(ptr,5) }
  if (retArray[4] == 5) {
    return 0
  }
  return 1
}

func main():Int64 {
  return arrayPass()
}
