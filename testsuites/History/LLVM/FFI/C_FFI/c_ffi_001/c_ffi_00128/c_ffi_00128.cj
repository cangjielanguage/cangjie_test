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
}

foreign func PassToCBigger(input:UnsafePtr): UnsafePtr

foreign func unsafePointerCast1(input: MyRecord): UnsafePtr
foreign func unsafePointerCast2(input: UnsafePtr): MyRecord


func PassAndReturnCStructByValueBigger():Int64
{
  var a = MyRecord()
  var aPtr = unsafe { unsafePointerCast1(a) }
  var bPtr = unsafe { PassToCBigger(aPtr) }
  var b = unsafe { unsafePointerCast2(bPtr) }
  return 0
}

func main():Int64 {
  return PassAndReturnCStructByValueBigger()
}
