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

open class A {
    var a = 1
}
class B <: A {
    var b = 2
}

func main() {
   var a1 = Aoo<()->A>(goo)
   if ( a1.a().b != 2 ){ // EXPECTED: regex error.*'b' is not a member of class 'A'
       return 2
   }
   return 0
}
