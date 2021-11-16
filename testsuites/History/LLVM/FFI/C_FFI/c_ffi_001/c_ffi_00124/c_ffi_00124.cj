// DEPENDENCE: %n.c
// EXEC: %compiler -frontend %cmp_opt %f -o %n.bc 2>&1 | compare %f
// ASSERT: regex native function can only have CType return.
class unsafeptr{}

record MyRecord {
  var a : Int64
  var b : Int64
  var c : Int64
}

foreign func PassToCBigger(input:unsafeptr): unsafeptr

foreign func unsafePointerCast1(input: MyRecord): unsafeptr
foreign func unsafePointerCast2(input: unsafeptr): MyRecord


func PassAndReturnCStructByValueBigger():Int64
{
  var a = MyRecord(1,1,1)
  var aPtr = unsafePointerCast2(a) // error here.
  var bPtr = PassToCBigger(aPtr)  // + 1
  var b = unsafePointerCast1(bPtr) // error here.
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
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
