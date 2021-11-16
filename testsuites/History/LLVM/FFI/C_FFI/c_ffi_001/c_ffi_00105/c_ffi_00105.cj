// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args

@c
record MyRecord {
    MyRecord(var x : Int64, var y : Int64, var z : Int64) {}
}

foreign func PassToCBigger(input:MyRecord): MyRecord

func PassAndReturnCStructByValueBigger():Int64
{
  var biggerPass = MyRecord(1,1,1)
  var biggerReturn = unsafe { PassToCBigger(biggerPass) }

  if (biggerReturn.x != Int64(2)) {
      return 1
  }
  if (biggerReturn.y != Int64(2)) {
      return 2
  }
  if (biggerReturn.z != Int64(2)) {
      return 3
  }
  return 0
}

func main():Int64 {
  return PassAndReturnCStructByValueBigger()
}
