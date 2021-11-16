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

interface J<T> <: I1<T> & I1<Int32> {
    func foo():Int64{
        return 1
    }
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

class B<T> <: J<String> {}