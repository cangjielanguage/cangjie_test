// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

open class Aoo<T> where T<:Aoo<T> {
    var a : B = B()
}

class B <:Aoo<B>{
    var b = 1
}

func main() {
   var a = Aoo<B>()
   if ( a.a.b != 1 ){
       return 1
   }
   return 0
}
