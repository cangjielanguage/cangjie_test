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
   var a4 = Aoo<(B)->Int64>(foo) // EXPECTED: regex error.*parameters and arguments mismatch
   return 0
}
