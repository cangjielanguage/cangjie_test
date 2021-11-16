// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T,V> where T<:V,T<:I1,V<:C1 {
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
class C2 <: C1 {
    var c = 1
}

func main() {
   var a = Aoo<I1,C1>(C1()) // EXPECTED: regex error.*generics type arguments do not match the constraint
   if ( a.a.c != 1 ){
       return 1
   }
   return 0
}
