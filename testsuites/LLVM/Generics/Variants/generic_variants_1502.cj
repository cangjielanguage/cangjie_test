// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    if ( B<String,Int64>("a").a != "a" ){
        return 1
    }
    return 0
}

open class A<T,V> {
    var x:T
    init(y:T){
        x = y
    }
}

class B<V,T> <: A<V,T> {
    init(n:V){
        super(n)
    }
    prop let a:V{
        get(){
            return x
        }
    }
}
