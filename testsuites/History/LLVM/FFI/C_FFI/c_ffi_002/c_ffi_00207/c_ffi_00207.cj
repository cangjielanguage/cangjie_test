// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f %cffi-link  lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args
from ffi import cffi.*
record MyRecord {
  MyRecord(var a : Int64) {}
}

foreign func AllocCStruct() : CPointer<MyRecord>
foreign func GetMaxFuncPtr(): CFunc<(CPointer<MyRecord>)->(CPointer<MyRecord>)>

func FuncFromC():Int64{
  var a = unsafe { GetMaxFuncPtr() }
  var input = MyRecord(1)
  var tmp = unsafe { AllocCStruct() }
  unsafe { tmp.write(0, input) }
  var b =  a(tmp)
  var res = unsafe { b.read(0) }
  if (res.a == 2) {
    return 0
  }
  return 1
}


func main():Int64 {
  return FuncFromC()
}
