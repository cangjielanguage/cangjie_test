// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

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
   if ( a1.a[0] != () ){
       return 1
   }
   if ( a1.a[1].a != 1 ){
       return 2
   }
   if ( a2.a[0]  != () ){
       return 3
   }
   if ( a2.a[1].a != 1 ){
       return 4
   }
   if ( a2.a[1].b != 2 ){
       return 5
   }
   if ( a3.a[0] != () ){
       return 6
   }
   if ( a3.a[1].a != 1 ){
       return 7
   }
   return 0
}
