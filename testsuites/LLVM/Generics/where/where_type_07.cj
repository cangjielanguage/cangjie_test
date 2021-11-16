// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T> where T<: Result<Int32> {
    var a : T
    init(x:T){
        a = x
    }
}


func main() {
   var a1 = Aoo<Result<Int32>>(Result<Int32>.Ok(1))
   if ( match (a1.a) { case Ok(x) => !true;case Err(_) => !false} ){
       return 1
   }
   return 0
}
