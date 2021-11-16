// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( C<Base>().a != "abc" ){
        return 2
    }
    return 0
}

class C<T> where T <: Base {
   prop let a:String{
       get(){
           return T.foo<T>()
       }
   }
}

enum Base {
    A | B
    static func foo<V>(){ return "abc" }
}
