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

foreign func unsafePointerCast11(input: MyRecord): UnsafePtr
foreign func unsafePointerCast12(input: UnsafePtr): MyRecord
foreign func unsafePointerCast21(input: MyRecord): UnsafePtr
foreign func unsafePointerCast22(input: UnsafePtr): MyRecord


func PassAndReturnCStructByValueBigger():Int64
{
  var a = MyRecord(1,1,1)
  var aPtr = unsafe { unsafePointerCast11(a) }
  var bPtr = unsafe { PassToCBigger(aPtr) } // + 1
  var b = unsafe { unsafePointerCast22(bPtr) }
  var bPtr2 = unsafe { unsafePointerCast21(b) }
  var cPtr = unsafe { PassToCBigger(bPtr2) } // + 1
  var c = unsafe { unsafePointerCast12(cPtr) }
  if (c.a != 3) {
    return 1
  }
  if (c.b != 3) {
    return 2
  }
  if (c.c != 3) {
    return 3
  }
  return 0
}

func main():Int64 {
  return PassAndReturnCStructByValueBigger()
}
