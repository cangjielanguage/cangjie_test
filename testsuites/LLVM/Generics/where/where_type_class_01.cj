// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T> where T<: A & B {
    var a : T
    init(x:T){
        a = x
    }
}

open class A{
}
class B <: A{
    func foo(){}
}

func main() {
   var a = Aoo<B>(B())
   if ( a.a.foo() != () ){
       return 1
   }
   return 0
}
