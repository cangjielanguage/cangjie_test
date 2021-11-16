// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B1<String,Int64>().m != 1 ){
        return 1
    }
    return 0
}

interface I<T> {
    func foo():Int64{
        return 1
    }
}

class B1<T,V> {}
extend B1<T,V> <: I<T> & I<V> {
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}