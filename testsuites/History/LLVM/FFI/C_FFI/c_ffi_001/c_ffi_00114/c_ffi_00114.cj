// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// ASSERT: regex undefined reference to `ErrorNativeName'

@c
record MyRecord {
  MyRecord(var a : Int64, var b : Int64, var c : Int64) {}
}

foreign func PassToCBigger(input:Int64): MyRecord

func PassAndReturnCStructByValueBigger():Int64
{
  var biggerPass = MyRecord(1,1,1)
  var biggerReturn = unsafe { PassToCBigger(1) }
  if (biggerReturn.a != 2) {
    return 1
  }
  if (biggerReturn.b != 2) {
    return 1
  }
  if (biggerReturn.c != 2) {
    return 1
  }
  return 0
}

func main():Int64 {
  return PassAndReturnCStructByValueBigger()
}
