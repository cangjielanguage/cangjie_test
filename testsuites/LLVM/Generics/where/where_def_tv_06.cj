// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T,V> where T<: T,V<:V {
    var a : T
    init(x:T){
        a = x
    }
}

func main() {
   var a = Aoo<Int32,String>(1)
   if ( a.a != 1 ) {
       return 1
   }
   return 0
}
