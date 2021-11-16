// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: ()->A & ()->B { // EXPECTED: regex error.*generic parameter 'T' cannot have two or more class irrelevant upper bounds
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
   var a1 = Aoo<()->A>(foo)
   var a2 = Aoo<()->B>(goo)
   return 0
}
