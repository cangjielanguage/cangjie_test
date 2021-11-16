// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T,V> where T<:V,T<:C1,V<:C2 {
    var a : T
    init(x:T){
        a = x
    }
}

open class C1 <: C2{
    var a = 1
}
open class C2 {
    var b = 1
}
class C3 <: C2 {
    var c = 1
}

func main() {
   var a = Aoo<C1,C2>(C1())
   if ( a.a.a != 1 ){
       return 1
   }
   return 0
}
