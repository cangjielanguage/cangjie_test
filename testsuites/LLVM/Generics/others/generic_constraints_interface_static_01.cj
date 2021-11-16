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
   prop let a:String{
       get(){
           return T.foo()
       }
   }
}

interface Base{
    static func foo(){ return "abc" }
}

class Data <: Base{}