// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args
foreign func ArrayFunc(arr:Array<Int32>): Array<Int32>

func arrayPass():Array<Int32>{
  var a : Array<Int32> = {0}
  return ArrayFunc(a)
}

func main():Int64 {
  return arrayPass()[0]
}
