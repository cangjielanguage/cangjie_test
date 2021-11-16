// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I<X,Y>{
    static func foo<X>(a:X):X{a}
}

class A<X,Y> <: I<X,Y>{

}

func main(){
    return A<Int64,Int32>.foo<Int64>(0)
}