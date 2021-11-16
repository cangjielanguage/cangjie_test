// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B<String>().a != 1 ){
        return 1
    }
    if ( C().a != 1 ){
        return 1
    }
    return 0
}

open class A<T> {
    func foo(){
        return 1
    }
}

class B<T> <: A<Int64> {
    prop let a:Int64{
        get(){
            return foo()
        }
    }
}

class C <: A<Int64> {
    prop let a:Int64{
        get(){
            return foo()
        }
    }
}