// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T> where T<: A & B {
    var a : T
    init(x:T){
        a = x
    }
}

interface A {
}
open class B {
    func foo(){}
}
class C <: B & A{
    func goo(){}
}


func main() {
   var a = Aoo<C>(C())
   if ( a.a.foo() != () ){
       return 1
   }
   return 0
}
