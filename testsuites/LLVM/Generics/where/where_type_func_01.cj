// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T> where T<: ()->Int8 {
    var a : T
    init(x:T){
        a = x
    }
}

func foo():Int8{
    return 1
}

func main() {
   var a1 = Aoo<()->Int8>(foo)
   if ( a1.a() != 1 ){
       return 1
   }
   return 0
}
