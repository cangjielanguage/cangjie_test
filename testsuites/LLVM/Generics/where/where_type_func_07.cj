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

open class A {
    var a = 1
}
class B <: A {
    var b = 2
}

func main() {
   var a1 = Aoo<(A)->Int64>(goo) // EXPECTED: regex error.*parameters and arguments mismatch
   var a2 = Aoo<(B)->Int64>(goo) // EXPECTED: regex error.*generics type arguments do not match the constraint
   var a3 = Aoo<(A)->Int64>(foo) // normal
   var a4 = Aoo<(B)->Int64>(foo) // EXPECTED: regex error.*generics type arguments do not match the constraint
   return 0
}
