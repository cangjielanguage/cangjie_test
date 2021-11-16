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

foreign func PassToCBigger(input:UnsafePtr): UnsafePtr

foreign func unsafePointerCast1(input: MyRecord): UnsafePtr
foreign func unsafePointerCast2(input: UnsafePtr): MyRecord


func PassAndReturnCStructByValueBigger():Int64
{
  var a = MyRecord(1,1,1)
  var aPtr = unsafe { unsafePointerCast1(a) }
  var b = unsafe { unsafePointerCast2(aPtr) }
  if (b.a != 1) {
    return 1
  }
  if (b.b != 1) {
    return 2
  }
  if (b.c != 1) {
    return 3
  }
  return 0
}

func main():Int64 {
  return PassAndReturnCStructByValueBigger()
}
