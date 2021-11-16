// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

interface I {} 

class A <: I{
	var a = 2
}

extend Int64 { 
  /* TODO: non static Generatic Type function not supported 
  func f<T>(a: T, b!: Int64 = 0) where T <: I {
    return 1
  } */
  private func f(a: String, b: String) {
    return 2
  } 
}



func main(): Int64{
  return /*1.f<A>(A()) + */ 1.f("", "") - 3;  //EXPECTED: regex type of return expression is incompatible with return type
}