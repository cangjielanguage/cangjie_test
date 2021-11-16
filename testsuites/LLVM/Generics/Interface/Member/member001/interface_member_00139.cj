// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I<X>{
    static func foo<Y>(a:X,b:Y):Y{b}
}

class A<X> <: I<X>{

}

func main(){
    return Int64(A<Int64>.foo<Int32>(0,0))
}