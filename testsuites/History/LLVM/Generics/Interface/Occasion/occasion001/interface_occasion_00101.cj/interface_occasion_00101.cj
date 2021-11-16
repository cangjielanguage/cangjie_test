// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait update{
    func test(a:This):Int64
}

class A{}

append A with update{
    func test(a:A):Int64{return 1}
}

interface I<T> where T<:update {
    func foo(a:T){
        return test(a)
    }
}

class B <: I<A>{}

func main(){
    var i : I<A> = B()
    if (i.foo(A()) != Int64(1)) {
        return 1
    }
    return 0
}