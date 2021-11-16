// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( C<Base<Int64>>().a != "abc" ){
        return 2
    }
    return 0
}

class C<T> where T <: Base<Int64> {
   prop let a:String{
       get(){
           return T.foo<Char>()
       }
   }
}

enum Base<T> {
    A | B
    static func foo<V>(){ return "abc" }
}
