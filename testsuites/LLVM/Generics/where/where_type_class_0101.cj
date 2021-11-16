// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: A & B { // EXPECTED: regex error.*generic parameter 'T' cannot have two or more class upper bounds 'Class-[AB], Class-[AB]' without subtype relation
    var a : T
    init(x:T){
        a = x
    }
}

open class A{
}
class B {
    func foo(){}
}

func main() {
   var a = Aoo<B>(B())
   if ( a.a.foo() != () ){
       return 1
   }
   return 0
}
