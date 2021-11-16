// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B<String>().foo() != 2 ){
        return 1
    }
    return 0
}

interface I<T> {
    func foo():Int64{
        return 1
    }
}

interface J<T> <: I<T> & I<Int32> {
    func foo():Int64{
        return 2
    }
}

class B<T>  <: J<String> {

}