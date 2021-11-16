// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface R<T>{
  //static
   func funca(a:Int32, b:T): Int32{
    return a
  }
}

class C<T> <: R<T>{
	
}

let a = C<Bool>().funca

func main(): Int64{
	return Int64(a(3, true) - 3)
}