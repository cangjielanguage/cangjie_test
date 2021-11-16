// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T> where T<:A<T> {
    var a : T
    init(x:T){
        a = x
    }
}

open class A<T> {
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
