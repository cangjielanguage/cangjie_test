// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B<List<String>>().a != 1 ){
        return 1
    }
    return 0
}

open class A<T> {
    func foo(){
        return 1
    }
}

class B<T> <: A<Set<Char>> {
    prop let a:Int64{
        get(){
            return foo()
        }
    }
}

