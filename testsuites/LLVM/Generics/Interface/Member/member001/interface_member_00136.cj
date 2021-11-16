// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I<X>{
    static func foo<X>(a:X):X{a}
}

class A<:I<Int8>{

}
func main(){
    return A.foo<Int64>(0)
}