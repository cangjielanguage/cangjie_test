// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    static func f<T>(a:T){}

}


func main(){
    A.f<Int64>(1)
    return 0
}