// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B1<String>().m != 2 ){
        return 1
    }
    if ( B2<String>().m != 3 ){
        return 1
    }
    return 0
}

open class A<T> {
    static var a:Int64 = 1
    func foo(){
        return a
    }
}

class B1<T> <: A<T>  {
    prop let m:Int64{
        get(){
            A<T>.a = 2
            return foo()
        }
    }
}

class B2<T> <: A<T>  {
    prop let m:Int64{
        get(){
            A<T>.a = 3
            return foo()
        }
    }
}

