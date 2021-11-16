// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I<X>{
  static func foo<Y>(a:Y):Y{a} // EXPECTED:regex error.*?modifier is not allowed here
}

class A<X> <: I<X>{

}

func main(){
  return A<Bool>.foo(0)
}
