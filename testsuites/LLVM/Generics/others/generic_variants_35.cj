// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( A<String>("a").a != "a" ){
        return 1
    }
    return 0
}

open class A<T> {
    var x:T
    init(y:T){
        x = y
    }
    prop let a:T{
        get(){
            return x
        }
    }
}