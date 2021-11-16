// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B<Base>().a != "a" ){
        return 2
    }
    Base.m = "b"
    if ( B<Base>().a != "b" ){
        return 2
    }
    return 0
}

class B<T> where T <: Base{
   var b: String = ""
   var a = T.m
}

open class Base{
    static var a : String = "a"
    static prop var m:String{
        get(){
          return a
        }
        set(v){
            a = v
        }
    }
}

