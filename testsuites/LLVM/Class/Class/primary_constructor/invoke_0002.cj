// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data2 {
  Data2(var a! : Int64 = 5){
   this.a = a
  }
}

var b = Data2(a: 0)

func main(): Int64 {
  return b.a
}

