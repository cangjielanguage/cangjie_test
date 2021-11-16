// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

open class Aoo<T> where T<:A<T> {
    var a : T
    init(x:T){
        a = x
    }
}

open class A<T> {
    func foo(x:T){return x}
}

class B <:A<B>{
    var b = 1
}

func main() {
   var a = Aoo<B>(B())
   if ( a.a.b != 1 ){
       return 1
   }
   return 0
}
