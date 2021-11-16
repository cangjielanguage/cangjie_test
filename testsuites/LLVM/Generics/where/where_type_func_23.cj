// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: (A)->Int8 & (B)->Int16 { // EXPECTED: regex error.*generic parameter 'T' cannot have two or more class irrelevant upper bounds
    var a : T
    init(x:T){
        a = x
    }
}

func foo(x:A):Int8{
    return 1
}
func goo(x:B):Int8{
    return 2
}

open class A {
}
class B <: A {
}

func main() {
   var a1 = Aoo<(B)->Int16>(goo)
   var a2 = Aoo<(A)->Int16>(foo)
   return 0
}
