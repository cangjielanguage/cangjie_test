// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T,V> where T<:V,T<:C1,V<:I1{
    var a : T
    init(x:T){
        a = x
    }
}

interface I1{
    func a(){return 1}
}

open class C1 <: I1{
    var b = 1
}

func main() {
   var a = Aoo<C1,I1>(C1())
   if ( a.a.b != 1 ){
       return 1
   }
   return 0
}
