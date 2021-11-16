// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T> where T<: Bool & Any {
    var a : T
    init(x:T){
        a = x
    }
}

func main() {
   var a = Aoo<Bool>(false)
   if ( a.a ){
       return 1
   }
   return 0
}
