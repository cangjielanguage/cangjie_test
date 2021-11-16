// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

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
   var a2 = Aoo<()->B>(goo)
   var a3 = Aoo<()->A>(foo)
   if ( a1.a().a != 1 ){
       return 1
   }
   if ( a2.a().a != 1 ){
       return 2
   }
   if ( a2.a().b != 2 ){
       return 3
   }
   if ( a3.a().a != 1 ){
       return 4
   }
   return 0
}
