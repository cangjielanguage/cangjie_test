// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: A & B {
    var a : T
    init(x:T){
        a = x
    }
}

interface A {
}
interface B {
}
class D <: B {
    func foo(){ return 2}
}

func main() {
   var a = Aoo<D>(D()) // EXPECTED: regex error.*generics type arguments do not match the constraint
   a.a.foo()
   return 0
}
