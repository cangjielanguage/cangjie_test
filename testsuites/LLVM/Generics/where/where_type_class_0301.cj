// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

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
class C <: A {
}
extend C <: B{
    func foo(){ return 1}
}
class D <: B {
    func foo(){ return 2}
}
class E <: A & B {
    func foo(){return 3}
}


func main() {
   var b = Aoo<E>(E())
   if ( b.a.foo() != 3 ){
       return 1
   }
   var c = Aoo<C>(C())
   if ( c.a.foo() != 1 ){
       return 1
   }
   return 0
}
