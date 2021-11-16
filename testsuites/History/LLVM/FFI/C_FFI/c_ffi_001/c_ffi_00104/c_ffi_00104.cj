// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args

@c
record BiggerStruct {
    BiggerStruct(var a : Int64,
                let b : Int64,
                var c : Int64,
                let d : Int64) {}
}

foreign func PassToCBigger(x:BiggerStruct): BiggerStruct

func PassAndReturnCStructByValueBigger():Int64
{
  var biggerPass = BiggerStruct(1,1,1,1)
  var biggerReturn = unsafe { PassToCBigger(biggerPass) }

  if (biggerReturn.a != Int64(1)) {
      return 1
  }
  if (biggerReturn.b != Int64(1)) {
      return 2
  }
  if (biggerReturn.c != Int64(2)) {
      return 3
  }
  if (biggerReturn.d != Int64(2)) {
      return 4
  }
  return 0
}

func main():Int64 {
  return PassAndReturnCStructByValueBigger()
}
