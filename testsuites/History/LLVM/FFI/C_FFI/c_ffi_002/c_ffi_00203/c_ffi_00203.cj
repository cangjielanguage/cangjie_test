// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// ASSERT: regex undefined reference to `errorFuncName'
class UnsafeFuncPtr{}
foreign func errorFuncName(): UnsafeFuncPtr
foreign func unsafePointerCast(ptr:UnsafeFuncPtr): Int32 * Int32 -> Int32

func FuncFromC():Int32{
  var a = errorFuncName()
  var Max = unsafePointerCast(a)
  var res = Max(0,1)
  return res
}


func main():Int64 {
  return FuncFromC()
}
