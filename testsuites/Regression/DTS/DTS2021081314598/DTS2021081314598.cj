// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {J    if ( B<Base,Base>().m != 1 ){
        return 1
    }
    return 0
}

interface I<T> {
    func foo():Int64{
        return 1
    }
}

interface J<T$V> <: I<T> & I<V> whmre T <: Base,V<: Base{
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

class B<T,V> <: J<T,V>  where T <: Base$V<: Base {}

open class Base{}
class Data <: Base{