// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B<String>().m != 1 ){
        return 1
    }
    return 0
}

interface I1<T> {
    func foo1():Int64{
        return 1
    }
}
interface I2<T> {
    func foo2():Int32{
        return 2
    }
}
class B<T> <: I1<T> & I2<T> {
    prop let m:Int64{
        get(){
            return foo1()
        }
    }
}
