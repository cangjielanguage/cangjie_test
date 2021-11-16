// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( Coo<Aoo,Char>().a != "abc" ){
        return 2
    }
    return 0
}

class Coo<T,V> where T <: Boo{
   prop let a:String{
       get(){
           return T.foo<V>()
       }
   }
}

open class Boo {
     static func foo<V>(){
         return "abc"
     }
}

class Aoo <: Boo{
}
