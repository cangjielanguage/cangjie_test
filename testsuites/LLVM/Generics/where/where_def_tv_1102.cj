// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T,V> where T<:V,T<:C1,V<:C2 {
    var a : T
    init(x:T){
        a = x
    }
}

open class C1{
    var a = 1
}
open class C2 <: C1{
    var b = 1
}
class C3 <: C2 {
    var c = 1
}

func main() {
   var a = Aoo<C1,C2>(C1()) // EXPECTED: regex error.*generics type arguments do not match the constraint
   return 0
}
