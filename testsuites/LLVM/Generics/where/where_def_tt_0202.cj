// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

open class Aoo {
    var a : B = B()
}

class B <:Aoo{
    var b = 1
}

func main() {
   var a = Aoo()
   if ( a.a.b != 1 ){
       return 1
   }
   return 0
}
