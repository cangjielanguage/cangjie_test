// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args

record MyRecord {
  var a : Int64
  var b : Int64
  var c : Int64
  var d : Array<Int64>
}

foreign func PassToCBigger(input:MyRecord): MyRecord

func PassAndReturnCStructByValueBigger():Int64
{
  var biggerPass = MyRecord(1,1,1,{0})
  var biggerReturn = PassToCBigger(biggerPass)
  if (biggerReturn.d[0] != 1) {
    return 1
  }
  return 0
}

func main():Int64 {
  return PassAndReturnCStructByValueBigger()
}
