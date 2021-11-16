// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T> where T<: (A)->Int64 {
    var a : T
    init(x:T){
        a = x
    }
}

func foo(x:A):Int64{
    return 1
}
func goo(x:B):Int64{
    return 2
}

open class B {
    var b = 2
}
class A <: B {
    var a = 1
}

func main() {
   var a1 = Aoo<(A)->Int64>(goo)
   var a2 = Aoo<(B)->Int64>(goo)
   var a3 = Aoo<(A)->Int64>(foo) // normal
   if ( a1.a(A()) != 2 ){
       return 1
   }
   if ( a2.a(B()) != 2 ){
       return 2
   }
   if ( a3.a(A()) != 1 ){
       return 3
   }
   return 0
}
