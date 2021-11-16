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
    func test(a:T):Bool{
        return true
    }
    func foo(a:T){
        return test(a) // shadow to true.
    }
}

class B <: I<A>{}

func main(){
    var i : I<A> = B()
    var j : B = B()
    if (i.foo(A()) != true) {
        return 1
    }
    if (j.foo(A()) != true) {
        return 2
    }
    return 0
}