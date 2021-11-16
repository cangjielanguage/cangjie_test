// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: ()->A {
    var a : T
    init(x:T){
        a = x
    }
}

func foo():A{
    return A()
}
func goo():B{
    return B()
}

open class B {
    var b = 2
}
class A <: B {
    var a = 1
}

func main() {
   var a1 = Aoo<()->A>(goo) // EXPECTED: regex error.*parameters and arguments mismatch
   var a2 = Aoo<()->B>(goo) // EXPECTED: regex error.*generics type arguments do not match the constraint
   var a3 = Aoo<()->A>(foo) // normal
   var a4 = Aoo<()->B>(foo) // EXPECTED: regex error.*generics type arguments do not match the constraint
   return 0
}
