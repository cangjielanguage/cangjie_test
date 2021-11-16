// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B<String,Int64>().m != 1 ){
        return 1
    }
    return 0
}

interface I<T> {
    func foo():Int64{
        return 1
    }
}

class B<T,V> <: I<T> {}
extend B<T,V> <: I<V> {
    func foo():Int64{
        return 1
    }

    prop let m:Int64{
        get(){
            return foo()
        }
    }
}