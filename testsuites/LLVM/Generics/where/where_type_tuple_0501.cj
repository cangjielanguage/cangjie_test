// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: Unit*A {
    var a : T
    init(x:T){
        a = x
    }
}

open class A {
    var a = 1
}
class B <: A {
    var b = 2
}

func main() {
   var a1 = Aoo<Unit*A>(((),B()))
   var a2 = Aoo<Unit*B>(((),B()))
   var a3 = Aoo<Unit*A>(((),A()))
   if ( a1.a[1].b != 1 ){ // EXPECTED: regex error.*'b' is not a member of class 'A'
       return 2
   }
   if ( a3.a[1].b != 1 ){ // EXPECTED: regex error.*'b' is not a member of class 'A'
       return 7
   }
   return 0
}
