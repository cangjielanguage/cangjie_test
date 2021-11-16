// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B<C>().m != 1 ){
        return 1
    }
    return 0
}

interface I1<T,V> {
    func foo():Int64{
        return 1
    }
}

interface J<T,V> <: I1<T,V> & I1<T,Int32> {
    func foo():Int64{
        return 1
    }
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

class B<T> where T <: J<String,String> {
    let m:Int64 = 1
}
class C <: J<String,String> {}