// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return 0
}

interface I<T> {
    func foo():Int64{
        return 1
    }
}

class B<T,V> <: I<T> & I<V> where T<: String,V<:String {
    func foo():Int64{
        return 1
    }
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

