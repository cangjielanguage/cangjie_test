// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( C<String>().m != 1 ){
        return 1
    }
    return 0
}

interface I<T> {
    func foo(){
        return 1
    }
}

interface B<T> <: I<T> {
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}

class C<T> <: B<T>{}
