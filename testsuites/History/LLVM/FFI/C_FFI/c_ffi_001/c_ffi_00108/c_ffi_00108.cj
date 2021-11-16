// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args

@c
record MyRecord {
}

foreign func PassToCBigger(input:MyRecord): MyRecord

func PassAndReturnCStructByValueBigger():Int64
{
  var biggerPass = MyRecord()
  var biggerReturn = unsafe { PassToCBigger(biggerPass) }
  return 0
}

func main():Int64 {
  return PassAndReturnCStructByValueBigger()
}
