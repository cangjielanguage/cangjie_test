// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B<String>().m != 1 ){
        return 1
    }
    if ( B1<String>().m != 1 ){
        return 1
    }
    return 0
}

interface I<T> {
    func foo():Int64{
        return 1
    }
}

class B<T> <: I<String>{}
extend B<T> <: I<Int64> {
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

class B1<T>{}
extend B1<T> <: I<String> & I<Int64> {
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

