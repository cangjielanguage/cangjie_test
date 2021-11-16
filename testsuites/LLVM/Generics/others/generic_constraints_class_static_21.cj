// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    if ( Coo<Boo<Aoo>,Aoo>().a != "abc" ){
        return 2
    }
    return 0
}

class Coo<T,V> where T <: Boo<V>{
   prop let a:String{
       get(){
           return T.foo().foo()
       }
   }
}

class Boo<V> where V <: Aoo {
     static func foo():Aoo { return Aoo() }
}


class Aoo {
    func foo(){ return "abc" }
}