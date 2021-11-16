// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class C<X> where X <: C<A> {
    func foo(){}
    init() {}
    init(input:X){
        let a : Unit = input.foo()
    }
}

interface I<X> where X <: I<B> {}

class A <: C<A> {}
class B <: I<B> {}

func main():Int64{
    return 0
}
