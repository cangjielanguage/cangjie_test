// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    init(){
        func f<T>(a:T){}
        f<Int64>(1)
    }
}


func main(){
    A()
    return 0
}