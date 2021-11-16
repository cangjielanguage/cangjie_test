// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B<String>("1").m != "1" ){
        return 1
    }
    return 0
}

open class A<T> {
    var a:T
    init(x:T){
        a = x
    }
    func foo():T{
        return a
    }
}

class B<T> <: A<T> {
    var b:T
    init(x:T){
        super(x)
        b = x
    }
    prop let m:T{
        get(){
            return foo()
        }
    }
}

