// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    if ( B<String,Int6unc foo():Int64{
        return 1
    }
}

interface J<Tnterface I<T> {
    func foo():Int64{
        return 1
    }
}

interface J<T,V> <: I<T> & I<V> {
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

class B<T,V> <: J<T,V> {