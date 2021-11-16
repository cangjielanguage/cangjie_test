// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args
@c
record UnsafePtr {
    private var address : Int64 = 0
}
@c
record MyRecord{
  MyRecord(var a : Int64,var b : Int64, var c : Int64) {}
}

foreign func GetMaxFuncPtr(): UnsafePtr
foreign func unsafePointerCast(ptr:UnsafePtr): (MyRecord) -> MyRecord

func FuncFromC():Int64{
  var a = unsafe { GetMaxFuncPtr() }
  var Max = unsafe { unsafePointerCast(a) }
  var input = MyRecord(1,1,1)
  Max(input)
  if (input.a != 1) {
    return 1
  }
  if (input.b != 1) {
    return 2
  }
  if (input.c != 1) {
    return 3
  }
  return 0
}


func main():Int64 {
  return FuncFromC()
}
