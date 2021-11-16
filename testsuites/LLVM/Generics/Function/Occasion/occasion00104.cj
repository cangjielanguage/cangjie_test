// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A{
    static func f<T2>(a:T2){}
}
class Test <: A{}

func main(){
    var a :Int32 = 0
    Test.f<Int32>(a)
    return 0
}