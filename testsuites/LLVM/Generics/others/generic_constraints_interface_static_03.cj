// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B<Data>().a != "abc" ){
        return 2
    }
    return 0
}

class B<T> where T <: Base{
   var b: String = ""
   var a = T.m
}

interface Base{
    static prop var m:String{
        get(){
          return "abc"
        }
        set(v){

        }
    }
}

class Data <: Base{}
