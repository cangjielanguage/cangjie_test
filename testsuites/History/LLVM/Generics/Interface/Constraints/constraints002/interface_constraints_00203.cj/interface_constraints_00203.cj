// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{}

trait update{
    func foo(a:This):Int64
}

trait child where This <: update{}

append A with child, update{
    func foo(a:A):Int64{return 1}
}

interface I<T>  where T<:update {
    static func test(a:T):Int64{
        return a.foo()
    }
}

class Test<T> <: I<T> where T<:update {}

func main(){
    if (Test<A>.test(A()) == 1) {
        return 0
    }
    return 1
}
