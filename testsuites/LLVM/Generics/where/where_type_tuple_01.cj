// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T> where T<: Unit*Int64 {
    var a : T
    init(x:T){
        a = x
    }
}

func main() {
   var a1 = Aoo<Unit*Int64>(((),1))
   if ( a1.a[0] != () || a1.a[1] != 1 ){
       return 1
   }
   return 0
}
