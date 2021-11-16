// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class R<T>{
  static func funca(a:Int32, b:T): Int32{
    return a
  }
}

let a = R<Bool>.funca

func main(): Int64{
  a(1, true)
	return 0
}