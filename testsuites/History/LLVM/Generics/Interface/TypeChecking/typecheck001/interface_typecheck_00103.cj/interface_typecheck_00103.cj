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
    func test(a:Int64):Int64{
        return 2
    }
    func foo(a:T){
        // return a.test()
        return test(a)
    }
}

class B <: I<A>{}

func main(){
    var i : I<A> = B()
    var j : B = B()
    if (i.foo(A()) != Int64(1)) {
        return 1
    }
    if (j.foo(A()) != Int64(1)) {
        return 2
    }
    if (i.test(Int64(2)) != Int64(2)) {
        return 3
    }
    if (j.test(Int64(2)) != Int64(2)) {
        return 4
    }
    return 0
}