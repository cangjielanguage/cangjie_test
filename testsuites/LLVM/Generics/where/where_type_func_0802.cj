// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

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
   if ( a1.a(B()) != 2 ){ // EXPECTED: regex error.*argument is mismatched with parameter type 'Class-A'
       return 1
   }
   return 0
}
