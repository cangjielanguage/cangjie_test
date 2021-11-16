// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    if ( B<Data<Int64>,Int64>().a != "abc" ){
        return 2
    }
    return 0
}

class B<T,V> where T <: Base<Int64> {
   var b: String = ""
   var a:String = T.foo<V>()
}

interface Base<T>{
    static func foo<V>(){ return "abc" }
}

class Data<T> <: Base<T>{}
