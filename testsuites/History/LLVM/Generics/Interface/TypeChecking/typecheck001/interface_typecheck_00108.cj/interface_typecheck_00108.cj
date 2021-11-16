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
    func test<T>(a:T):T{
        return a
    }
    func foo(a:T){
        return a.test()
    }
}

class B <: I<A>{}

func main(){
    var i : I<A> = B()
    return 0
}