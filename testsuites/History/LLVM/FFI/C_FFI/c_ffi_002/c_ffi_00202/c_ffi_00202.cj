// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args
class UnsafeFuncPtr{}
foreign func GetMaxFuncPtr(): UnsafeFuncPtr
foreign func unsafePointerCast(ptr:UnsafeFuncPtr): Int32 -> Int32

func FuncFromC():Int32{
  var a = GetMaxFuncPtr()
  var Max = unsafePointerCast(a)
  var res = Max(1)
  return res
}


func main():Int64 {
  return FuncFromC()
}
