// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args
@c
record UnsafePtr {
    private var address : Int64 = 0
}

@c
record MyRecord {
  MyRecord(var a : Int64, var b : Int64, var c : Int64) {}
}

@c
record MyRecord2 {
  MyRecord2(var a : Int64, var b : Int64, var c : Int64) {}
}

foreign func PassToCBigger(input:UnsafePtr): UnsafePtr

foreign func unsafePointerCast11(input: MyRecord): UnsafePtr
foreign func unsafePointerCast12(input: UnsafePtr): MyRecord

foreign func unsafePointerCast21(input: MyRecord2): UnsafePtr
foreign func unsafePointerCast22(input: UnsafePtr): MyRecord2

func PassAndReturnCStructByValueBigger():Int64
{
  var a = MyRecord(1,1,1)
  var aPtr = unsafe { unsafePointerCast11(a) }
  aPtr = unsafe { PassToCBigger(aPtr) }
  var b = unsafe { unsafePointerCast22(aPtr) }
  if (b.a != 2) {
    return 1
  }
  if (b.b != 2) {
    return 2
  }
  if (b.c != 2) {
    return 3
  }
  return 0
}

func main():Int64 {
  return PassAndReturnCStructByValueBigger()
}
