// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f


interface R<T>{
  static func funca(a:Int32, b:T): Int32{
    return a
  }
}

class C<T> <: R<T>{
	
}

let a = C.funca  // EXPECTED: regex generic type should be used with type argument
var b = C.funca  // EXPECTED: regex generic type should be used with type argument

func main(): Int64{
	return 0
}
