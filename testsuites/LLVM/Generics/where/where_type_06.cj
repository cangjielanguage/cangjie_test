// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T> where T<: Option<Int32> {
    var a : T
    init(x:T){
        a = x
    }
}


func main() {
   var a1 = Aoo<Option<Int32>>(Option<Int32>.Some(1))
   if ( match (a1.a) { case Some(x) => !true;case _ => !false} ){
       return 1
   }
   return 0
}
