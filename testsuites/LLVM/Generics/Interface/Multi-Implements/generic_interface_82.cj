// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B<String>().m != 1 ){
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

class B<T> <: I1<String> & I2<Int64> {
    func foo():Int64{
        return 1
    }
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}
