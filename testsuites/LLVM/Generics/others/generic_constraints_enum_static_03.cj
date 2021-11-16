// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B<Base>().a != "a" ){
        return 2
    }
    return 0
}

class B<T> where T <: Base{
   var b: String = ""
   var a = T.m
}

enum Base{
    A | B
    static prop let m:String{
        get(){
          return "a"
        }
    }
}

