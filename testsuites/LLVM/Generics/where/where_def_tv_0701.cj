// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

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
   var a = Aoo<A<String>,Int32>(A<String>("a")) // EXPECTED: regex error.*generics type arguments do not match the constraint
   if ( a.a.a != "a" ) {
       return 1
   }
   return 0
}
