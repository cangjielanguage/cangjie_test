// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T> where T<: B & I {
    var a : T
    init(x:T){
        a = x
    }
}

record B <: I{
    var b = 1
}
interface I{}

func main() {
   var a = Aoo<B>(B())
   if ( a.a.b != 1 ){
       return 1
   }
   return 0
}
