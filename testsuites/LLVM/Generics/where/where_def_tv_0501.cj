// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T,V> where T<: V ,V<:T {
    var a : T
    init(x:T){
        a = x
    }
}

func main() {
   var a = Aoo<Int32,Any>(1) // EXPECTED: regex error.*generics type arguments do not match the constraint
   if ( a.a != 1 ) {
       return 1
   }
   return 0
}
