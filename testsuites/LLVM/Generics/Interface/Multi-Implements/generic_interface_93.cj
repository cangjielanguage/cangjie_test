// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B<String,Int64>().m != 1 ){
        return 1
    }
    return 0
}

interface I1<T> {
    func foo():Int64{
        return 1
    }
}
interface I2<T> <: I1<T>{}
interface J<T,V> <: I1<T> & I2<V> {
    func foo():Int64{
        return 1
    }
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

class B<T,V> <: J<T,V> {}