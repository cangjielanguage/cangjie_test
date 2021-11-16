// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I<X>{
    static func foo<Y>(a:Y):Y{a}
}

class A<:I<Int64>{

}

func main(){
    return Int64(A.foo<Int32>(0))
}