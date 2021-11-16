// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: A & ()->B { // EXPECTED: regex-auto generic parameter 'T' cannot have class irrelevant upper bounds '() -> Class-B' and class upper bounds 'Class-A' at the same time
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

open class A {
}
class B <: A {
}

func main() {
   var a1 = Aoo<A>(A())
   var a2 = Aoo<()->B>(goo)
   return 0
}
