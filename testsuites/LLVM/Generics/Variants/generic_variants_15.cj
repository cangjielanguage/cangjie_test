// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    if ( B<String>("a").a != "a" ){
        return 1
    }
    return 0
}

open class A<T> {
    var x:T
    init(y:T){
        x = y
    }

}

class B<V> <: A<V> {
    var m:V
    init(n:V){
        super(n)
        m = n
    }
    prop let a:V{
        get(){
            return x
        }
    }
}
