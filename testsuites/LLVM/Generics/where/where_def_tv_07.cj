// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T,V> where T<: A<V> {
    var a : T
    init(x:T){
        a = x
    }
}

class A<T>{
    var a : T
    init(x:T){
        a = x
    }
}

func main() {
   var a = Aoo<A<String>,String>(A<String>("a"))
   if ( a.a.a != "a" ) {
       return 1
   }
   return 0
}
