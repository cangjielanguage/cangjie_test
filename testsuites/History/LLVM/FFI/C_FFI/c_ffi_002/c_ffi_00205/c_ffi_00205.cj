// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output 2>&1 | compare %f
// ASSERT: regex undefined reference to `ErrorUnsafePointerCast'
@c
record UnsafePtr {
    private var address : Int64 = 0
}
foreign func GetMaxFuncPtr(): UnsafePtr
foreign func ErrorUnsafePointerCast(ptr:UnsafePtr): (Int32, Int32) -> Int32

func FuncFromC():Int64{
  var a = unsafe { GetMaxFuncPtr() }
  var Max = unsafe { ErrorUnsafePointerCast(a) }
  var res = Max(-1,0)
  return Int64(res)
}


func main():Int64 {
  return FuncFromC()
}
