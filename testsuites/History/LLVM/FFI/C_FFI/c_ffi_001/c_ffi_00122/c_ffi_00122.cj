// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output 2>&1 | compare %f
// ASSERT: regex undefined reference to `unsafepointerCast1'
// ASSERT: regex undefined reference to `unsafepointerCast2'
@c
record UnsafePtr {
    private var address : Int64 = 0
}

@c
record MyRecord {
  MyRecord(var a : Int64, var b : Int64, var c : Int64) {}
}

foreign func PassToCBigger(input:UnsafePtr): UnsafePtr

foreign func unsafepointerCast1(input: MyRecord): UnsafePtr
foreign func unsafepointerCast2(input: UnsafePtr): MyRecord


func PassAndReturnCStructByValueBigger():Int64
{
  var a = MyRecord(1,1,1)
  var aPtr = unsafe { unsafepointerCast1(a) }
  var bPtr = unsafe { PassToCBigger(aPtr) }
  var b = unsafe { unsafepointerCast2(bPtr) }
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
