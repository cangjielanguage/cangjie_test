// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T,V> where T<:V,T<:C1,V<:I1{
    var a : T
    init(x:T){
        a = x
    }
}

interface I1{
    func a(){return 1}
}

open class C1 {
    var b = 1
}

func main() {
   var a = Aoo<C1,I1>(C1()) // EXPECTED: regex error.*generics type arguments do not match the constraint
   if ( a.a.b != 1 ){
       return 1
   }
   return 0
}
