// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B<String>().m != 1 ){
        return 1
    }
    return 0
}

open class A<T> {
    func foo(){
        return 1
    }
}
interface I<T> {
    func foo(){
        return 2
    }
}

class B<T> <: A<T> & I<T> {
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}


