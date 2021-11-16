// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T,V> where T<: Any & V {
    var a : V
    init(x:V){
        a = x
    }
}

func main() {
   var a = Aoo<Int32,Int32>(1)
   if ( a.a != 1 ){
       return 1
   }
   return 0
}
